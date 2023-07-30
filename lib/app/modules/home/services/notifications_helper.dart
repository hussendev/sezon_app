import 'dart:convert';
import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:googleapis_auth/auth.dart';
import 'package:googleapis_auth/auth_io.dart';
import '../../../core/network/api_controller.dart';

class NotificationHelper {
  static String? myAccessToken;
  static FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  NotificationHelper() {
    getAccessToken().then((value) => myAccessToken = value.data);
  }

  static initializeNotification() {
    firebaseMessaging
        .getInitialMessage()
        .then((RemoteMessage? remoteMessage) {
      log("message getInitialMessage: ${remoteMessage?.data}");
      print("message getInitialMessage: ${remoteMessage?.data}");
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage? remoteMessage) {
      log("message onMessage: ${remoteMessage?.data}");
      print("message onMessage: ${remoteMessage?.data}");
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? remoteMessage) {
      log("message onMessageOpenedApp: ${remoteMessage?.data}");
      print("message onMessageOpenedApp: ${remoteMessage?.data}");
    });

    FirebaseMessaging.onBackgroundMessage((RemoteMessage? remoteMessage) async {
      log("message onBackgroundMessage: ${remoteMessage?.data}");
      print("message onBackgroundMessage: ${remoteMessage?.data}");
    });
  }

  /////////////////////

  static Future<AccessToken> getAccessToken() async {
    final serviceAccount = await rootBundle.loadString(
        "assets/fcm/sezon-f5127-firebase-adminsdk-d0gkh-51b296f7f7.json");
    final data = await json.decode(serviceAccount);

    final accountCredentials = ServiceAccountCredentials.fromJson({
      "private_key_id": data['private_key_id'],
      "private_key": data['private_key'],
      "client_email": data['client_email'],
      "client_id": data['client_id'],
      "type": data['type'],
    });

    final scopes = ["https://www.googleapis.com/auth/firebase.messaging"];
    final AuthClient authClient = await clientViaServiceAccount(
        accountCredentials, scopes)
      ..close();

    return authClient.credentials.accessToken;
  }

  //////////////////////////////////////////
  //////////////////////////////////////////

  static Future<void> sendNotification(
      {required String userToken, required title, required body}) async {
    try {
      if (myAccessToken == null) {
        await getAccessToken().then((value) => myAccessToken = value.data);
      }

      ApiController.post(
        "https://fcm.googleapis.com/v1/projects/sezon-f5127/messages:send",
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $myAccessToken',
        },
        body: jsonEncode({
          "message": {
            "token": userToken,

            "notification": {
              "title": title,
              "body": body
            },
          }
        }),
      );
    } catch (error) {
      log("Error is: $error");
    }
  }
// please use this method to send notification to all users

  static  Future<void> sendNotificationToAllUsers({required String title,required String body ,required String topic}) async {
        try {
          if (myAccessToken == null) {
            await getAccessToken().then((value) => myAccessToken = value.data);
          }

          ApiController.post(
            "https://fcm.googleapis.com/v1/projects/sezon-f5127/messages:send",
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $myAccessToken',
            },
            body: jsonEncode({
              "message": {
                "topic":topic,

                "notification": {
                  "title": title,
                  "body": body
                },
              }
            }),
          );
        } catch (error) {
          log("Error is: $error");
        }
      }

}
