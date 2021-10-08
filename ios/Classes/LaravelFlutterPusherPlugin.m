#import "LaravelFlutterPusherPlugin.h"
#if __has_include(<laravel_flutter_pusher/laravel_flutter_pusher-Swift.h>)
#import <laravel_flutter_pusher/laravel_flutter_pusher-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "laravel_flutter_pusher-Swift.h"
#endif

@implementation LaravelFlutterPusherPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftLaravelFlutterPusherPlugin registerWithRegistrar:registrar];
}
@end
