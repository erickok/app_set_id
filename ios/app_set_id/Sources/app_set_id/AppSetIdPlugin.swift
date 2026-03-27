import Flutter
import UIKit

public class AppSetIdPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "app_set_id", binaryMessenger: registrar.messenger())
    let instance = AppSetIdPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result(UIDevice.current.identifierForVendor?.uuidString)
  }
}
