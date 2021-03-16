import 'package:get/get.dart';
import '../core.dart';

part 'app_routes.dart';

class AppScreens {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => MainView(),
      binding: MainBinding(),
    ),
  ];
}
