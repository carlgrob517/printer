#import "PrinterPlugin.h"
#if __has_include(<printer/printer-Swift.h>)
#import <printer/printer-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "printer-Swift.h"
#endif

@implementation PrinterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftPrinterPlugin registerWithRegistrar:registrar];
}
@end
