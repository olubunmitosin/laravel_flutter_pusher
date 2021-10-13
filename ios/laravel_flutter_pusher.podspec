#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint laravel_flutter_pusher.podspec` to validate before publishing.
#
pubspec = YAML.load_file(File.join('..', 'pubspec.yaml'))
libraryVersion = pubspec['version'].gsub('+', '-')
pusherLibraryVersion = '~> 7.2'

Pod::Spec.new do |s|
  s.name             = 'laravel_flutter_pusher'
  s.version          = '0.0.4'
  s.summary          = 'Pusher client that supports laravel echo'
  s.description      = <<-DESC
Pusher client that supports laravel echo
                       DESC
  s.homepage         = 'https://github.com/olubunmitosin/laravel_flutter_pusher'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Olubunmi Tosin' => 'olubunmivictor6@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.dependency 'PusherSwift', pusherLibraryVersion
  s.platform = :ios, '9.0'

  s.ios.deployment_target = '10.0'
  s.prepare_command = <<-CMD
    echo // Generated file, do not edit > Classes/UserAgent.h
    echo "#define LIBRARY_VERSION @\\"#{libraryVersion}\\"" >> Classes/UserAgent.h
    echo "#define LIBRARY_NAME @\\"laravel_flutter_pusher\\"" >> Classes/UserAgent.h
    echo "#define PUSHER_LIBRARY_VERSION @\\"#{pusherLibraryVersion}\\"" >> Classes/UserAgent.h
  CMD
  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
