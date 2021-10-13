
# Laravel Flutter Pusher

[![pub package](https://img.shields.io/pub/v/laravel_flutter_pusher.svg)](https://pub.dartlang.org/packages/laravel_flutter_pusher)

An unofficial Flutter plugin that wraps [pusher-websocket-java](https://github.com/pusher/pusher-websocket-java) on Android and [pusher-websocket-swift](https://github.com/pusher/pusher-websocket-swift) on iOS.
This is a continued plugin for [Flutter Pusher Client](https://github.com/heywhy/flutter-pusher-client)

This package lets you consume events from a Pusher server. In order to use this library, you need to have a free account on <https://pusher.com>. After registering, you will need the application credentials for your app.
**NOTE** This package requires ``json_annotation : ^4.0.0``

# How to install
* Add to your pubspec.yaml
```
dependencies:
  laravel_flutter_pusher: ^0.0.4
```
<!-- * In `/ios/Podfile`, set global platform to at least 10.0
`platform :ios, '10.0'`

### For iOS Objective-C based Flutter apps
It is currently a bit difficult to get some Swift based Flutter plugins working in an Objective-C based Flutter app. See [here for info](https://github.com/flutter/flutter/issues/25676) and [here for a way to fix](https://github.com/fayeed/flutter_freshchat/issues/9#issuecomment-514329934).

This set of steps should work to fix this for your project.
* Add `use_frameworks!` to the end of the Runner section in `/ios/Podfile`
* Set Swift version in your iOS Runner project.
    * Open the project with Xcode.
    * In Runner, File -> New -> File -> Swift File. Name it anything.
    * Xcode will ask you if you wish to create Bridging Header, click yes.
    * Go to Runner `Build Settings` and set `SWIFT_VERSION` to either 4.2 or 5.0
    * Delete the Swift file created in step 2
    * Delete the Bridging Header created in step 3
* `flutter clean`
* In /ios `pod install --repo-update` -->

## Getting Started

```dart
import 'package:laravel_flutter_pusher/laravel_flutter_pusher.dart';

void main() {

  var options = PusherOptions(
          host: '10.0.2.2',
          port: 6001,
          encrypted: false,
          cluster: 'eu'
      );
  
      LaravelFlutterPusher pusher = LaravelFlutterPusher('app_key', options, enableLogging: true);
      pusher
          .subscribe('channel')
          .bind('event', (event) => log('event =>' + event.toString()));
}
```

### Lazy Connect

Connection to the server can be delayed, so set the **lazyConnect** prop on the client constructor.

##### R8/Proguard code obfuscation

If you have enabled code obfuscation with R8 or proguard, you need to add the following rule.

`android/app/build.gradle`:

```groovy
buildTypes {
  release {
    minifyEnabled true
    proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
  }
}
```

`android/app/proguard-rules.pro`:

```
-keep class com.github.olubunmitosin.laravel_flutter_pusher.** { *; }
```

## Development
Generate the models and the factories: `flutter packages pub run build_runner build --delete-conflicting-outputs`
