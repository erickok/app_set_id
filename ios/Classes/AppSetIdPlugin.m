#import "AppSetIdPlugin.h"
#if __has_include(<app_set_id/app_set_id-Swift.h>)
#import <app_set_id/app_set_id-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "app_set_id-Swift.h"
#endif

@implementation AppSetIdPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAppSetIdPlugin registerWithRegistrar:registrar];
}
@end
