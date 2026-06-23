import 'package:firebase_messaging/firebase_messaging.dart';


Future<String?> getDeviceToken() async {
  try {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    String? token = await messaging.getToken();
    print("Device Token: $token");
    return token;
  } catch (e) {
    print("Error getting device token: $e");
    return null;
  }
}
