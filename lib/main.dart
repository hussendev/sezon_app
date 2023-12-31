import 'dart:math';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sezon_app/app/utils/localizations/translation.dart';
import 'app/routes/app_pages.dart';
import 'app/utils/localizations/translation_contoller.dart';
import 'app/utils/storage/cach_helper.dart';
import 'firebase_options.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

 await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // This code just for ios and web
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (kDebugMode) {
      print('Got a message whilst in the foreground! Any comment');
      print('Message data: ${message.data}');
    }
    if (message.notification != null) {
      AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: Random().nextInt(1000),
            channelKey: "makeOrderChannel",
            title: "${message.notification!.title}",
            body: "${message.notification!.body}",
            notificationLayout: NotificationLayout.Default
        ),
      );
    }
  });

  await FirebaseMessaging.instance.subscribeToTopic("all");
  FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
    CacheHelper.saveData(key: 'fcm_token', value: newToken);

    print('event onTokenRefresh is: $newToken');
  });


  AwesomeNotifications().initialize(
    // set the icon to null if you want to use the default app icon
    null,
    [
      NotificationChannel(
        channelKey: "makeOrderChannel",
        channelName: 'New Order',
        channelDescription: 'Notification channel if anyone make order',
        defaultColor: const Color(0xFF9D50DD),
        playSound: true,
        channelShowBadge: true,
        defaultPrivacy: NotificationPrivacy.Private,
      ),
    ],
    // debug: true
  );

  // FirebaseMessaging.instance.getToken().then((value) {
  //   print(value);
  //   CacheHelper.getData(key: 'fcm_token') != null ? null : CacheHelper.saveData(key: 'fcm_token', value: value);
  // });

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // HomeGetXController controller =Get.put<HomeGetXController>(HomeGetXController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812)  ,
      minTextAdapt: true,
      builder: (context, child) {
        // HomeGetXController.
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sezon App',
          localizationsDelegates:const [
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ar', 'SA'),
            Locale('en', 'US'),
          ],
          locale: TranslationController.initalLang,
          fallbackLocale: const Locale('ar', 'SA'),
          translations: Translation(),
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.transparent,
              iconTheme: const IconThemeData(color: Colors.black),
              titleTextStyle: TextStyle(
                color: Colors.red,
                fontSize: 18.sp,
                fontFamily: 'Tajawal',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
        );
      },
    );
  }
}
