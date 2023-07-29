import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sezon_app/app/routes/app_pages.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

 await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


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
