import 'package:get/get.dart';
import 'package:sezon_app/app/modules/home/views/notification/notification_screen.dart';

import '../../views/core/lunch_screen.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/login.dart';
import '../modules/favorite/bindings/favorite_binding.dart';
import '../modules/favorite/views/favorite_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_screen.dart';
import '../modules/payment/bindings/payment_binding.dart';
import '../modules/payment/views/payment_view.dart';
import '../modules/product/bindings/product_binding.dart';
import '../modules/product/views/prodcut_details.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = _Paths.INITIAL;

  static final routes = [
    GetPage(
      name: _Paths.INITIAL,
      page: () => const LunchScreen(),
      binding: null,
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCTDETAILS,
      page: () => ProductDetails(),
      binding: null,
    ),
    GetPage(
      name: _Paths.PRODUCTDETAILS,
      page: () => ProductDetails(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITE,
      page: () => const FavoriteView(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => const PaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationWidget(),
      binding: null,
    ),
  ];
}
