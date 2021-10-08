import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:laravel_flutter_pusher/laravel_flutter_pusher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    setUpServices();
  }

  void setUpServices() {
    var options = PusherOptions(
        host: '10.0.2.2', port: 6001, encrypted: false, cluster: 'eu');

    LaravelFlutterPusher pusher =
        LaravelFlutterPusher('app_key', options, enableLogging: true);
    pusher
        .subscribe('channel')
        .bind('event', (event) => log('event =>' + event.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
      ),
    );
  }
}
