import Cocoa
import FlutterMacOS
import IOKit

public class AppSetIdPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "app_set_id", binaryMessenger: registrar.messenger)
        let instance = AppSetIdPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        result(macAddressAsString() ?? "<unavailable>")
    }
    
    func macAddressAsString() -> String? {
        let ref = copy_mac_address()
        var bytes: [UInt8] = [0, 0, 0, 0, 0, 0]
        ref?.getBytes(&bytes, length: bytes.count)
        let formatted = bytes.map { String(format:"%02x", $0) }.joined()
        return formatted
    }
    
    /// Taken from https://developer.apple.com/documentation/appstorereceipts/validating_receipts_on_the_device#//apple_ref/doc/uid/TP40010573-CH1-SW14
    
    // Returns an object with a +1 retain count; the caller needs to release.
    func io_service(named name: String, wantBuiltIn: Bool) -> io_service_t? {
        let default_port = kIOMasterPortDefault
        var iterator = io_iterator_t()
        defer {
            if iterator != IO_OBJECT_NULL {
                IOObjectRelease(iterator)
            }
        }
        
        
        guard let matchingDict = IOBSDNameMatching(default_port, 0, name),
              IOServiceGetMatchingServices(default_port,
                                           matchingDict as CFDictionary,
                                           &iterator) == KERN_SUCCESS,
              iterator != IO_OBJECT_NULL
        else {
            return nil
        }
        
        
        var candidate = IOIteratorNext(iterator)
        while candidate != IO_OBJECT_NULL {
            if let cftype = IORegistryEntryCreateCFProperty(candidate,
                                                            "IOBuiltin" as CFString,
                                                            kCFAllocatorDefault,
                                                            0) {
                let isBuiltIn = cftype.takeRetainedValue() as! CFBoolean
                if wantBuiltIn == CFBooleanGetValue(isBuiltIn) {
                    return candidate
                }
            }
            
            
            IOObjectRelease(candidate)
            candidate = IOIteratorNext(iterator)
        }
        
        
        return nil
    }
    
    func copy_mac_address() -> CFTypeRef? {
        // Prefer built-in network interfaces.
        // For example, an external Ethernet adaptor can displace
        // the built-in Wi-Fi as en0.
        guard let service = io_service(named: "en0", wantBuiltIn: true)
                ?? io_service(named: "en1", wantBuiltIn: true)
                ?? io_service(named: "en0", wantBuiltIn: false)
        else { return nil }
        defer { IOObjectRelease(service) }
        
        
        if let cftype = IORegistryEntrySearchCFProperty(
            service,
            kIOServicePlane,
            "IOMACAddress" as CFString,
            kCFAllocatorDefault,
            IOOptionBits(kIORegistryIterateRecursively | kIORegistryIterateParents)) {
            return cftype
        }
        
        
        return nil
    }
}
