import 'package:get/get_state_manager/get_state_manager.dart';

import '../../core.dart';

class HomeController extends GetxController {
  List<Car> cars = [];
  Car displayCar;

  @override
  void onInit() {
    super.onInit();
    cars = CarService().getCarsList();
    displayCar = cars[2];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
