import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:car_rental_app/services/navigation_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  final pageController = PageController();
  final animationDuration = Duration(milliseconds: 300);
  List<BubbleBottomBarItem> navigationItems;

  @override
  void onInit() {
    super.onInit();
    navigationItems = NavigationService().getNavigationItemList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    pageController.dispose();
    Get.delete();
    super.onClose();
  }
}
