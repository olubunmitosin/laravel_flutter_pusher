import Flutter
import UIKit

public class SwiftLaravelFlutterPusherPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "laravel_flutter_pusher", binaryMessenger: registrar.messenger())
    let instance = SwiftLaravelFlutterPusherPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
