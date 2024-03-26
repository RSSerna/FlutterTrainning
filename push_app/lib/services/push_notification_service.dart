import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../firebase_options.dart';

class PushNotificationService extends ChangeNotifier {
  /// ```dart
  /// import 'firebase_options.dart';
  /// // ...
  /// await Firebase.initializeApp(
  ///   options: DefaultFirebaseOptions.currentPlatform,
  /// );
  /// ```
  ///
  static FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  static String? token;

  static final StreamController<String> _streamController =
      StreamController.broadcast();
  static Stream<String> get messageStream => _streamController.stream;

  static Future _onBackgroundHandler(RemoteMessage msg) async {
    print('onBackground: ${msg.messageId}');
    _streamController.add(msg.notification?.title ?? 'No title');
  }

  static Future _onMessageHandler(RemoteMessage msg) async {
    print('onMessage: ${msg.messageId}');
    _streamController.add(msg.notification?.title ?? 'No title');
  }

  static Future _onOpenHandler(RemoteMessage msg) async {
    print('OnOpen: ${msg.messageId}');
    _streamController.add(msg.notification?.title ?? 'No title');
  }

  static Future initializeApp() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    token = await FirebaseMessaging.instance.getToken();
    print('Token: $token');

    //Handlers
    FirebaseMessaging.onBackgroundMessage(_onBackgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onOpenHandler);
  }

  static closeStream() {
    _streamController.close();
  }
}
