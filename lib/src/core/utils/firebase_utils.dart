import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseUtil {
  static final FirebaseUtil _instance = FirebaseUtil._internal();
  factory FirebaseUtil() => _instance;

  FirebaseUtil._internal();

  FirebaseMessaging get _firebaseMessaging => FirebaseMessaging.instance;

  Future<String?> initialize() async {
    if (Firebase.apps.isEmpty) {
      log('Firebase not initialized, skip FCM setup');
      return null;
    }

    NotificationSettings settings =
        await _firebaseMessaging.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('have permission');

      String? fcmToken = await _firebaseMessaging.getToken();
      log('FCM: $fcmToken');
      return fcmToken; 
    } else {
      log('no permission');
      return null;
    }
  }

  Future<String?> getFCMToken() async {
    if (Firebase.apps.isEmpty) return null;
    return await _firebaseMessaging.getToken();
  }

  Future<void> requestPermission() async {
    if (Firebase.apps.isEmpty) return;
    await _firebaseMessaging.requestPermission();
  }
}
