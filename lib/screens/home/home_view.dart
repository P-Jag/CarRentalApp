import 'package:badges/badges.dart';
import 'package:car_rental_app/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            color: Colors.grey[200],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildHeader(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
      ),
      child: Column(
        children: [
          _buildScreenHeader(),
          SizedBox(height: 8.0),
          _buildCarImage(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCarName(),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Text(
                      'My garage',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8.0),
                    Icon(
                      Icons.arrow_forward,
                      size: 23.0,
                      color: kPrimaryColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column _buildCarName() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            controller.displayCar.model,
            style: TextStyle(
              color: Colors.black,
              fontSize: 35.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 2.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            controller.displayCar.brand,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20.0,
            ),
          ),
        ),
      ],
    );
  }

  ValueBuilder<int> _buildCarImage() {
    return ValueBuilder<int>(
      initialValue: 0,
      builder: (currentImage, updateFn) => Column(
        children: [
          Container(
            height: 150,
            child: PageView(
              physics: BouncingScrollPhysics(),
              onPageChanged: updateFn,
              children: controller.displayCar.images.map((path) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Image.asset(
                    path,
                    fit: BoxFit.scaleDown,
                  ),
                );
              }).toList(),
            ),
          ),
          controller.displayCar.images.length > 1
              ? Container(
                  height: 30.0,
                  margin: EdgeInsets.only(top: 12.0, bottom: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: controller.displayCar.images
                        .map((image) => _buildIndicator(
                            controller.displayCar.images.indexOf(image) ==
                                currentImage))
                        .toList(),
                  ),
                )
              : Container()
        ],
      ),
    );
  }

  Widget _buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 6),
      height: 8,
      width: isActive ? 20 : 8,
      decoration: BoxDecoration(
          color: isActive ? Colors.black : Colors.grey[400],
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }

  Container _buildScreenHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 90.0,
            child: Stack(
              children: [
                CircularStepProgressIndicator(
                  totalSteps: 100,
                  currentStep: 77,
                  padding: 0,
                  selectedStepSize: 4,
                  width: 80.0,
                  height: 80.0,
                  startingAngle: 2.3,
                  selectedColor: Colors.yellow[600],
                  unselectedColor: Colors.white,
                  roundedCap: (_, __) => true,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: CircleAvatar(
                      maxRadius: 30.0,
                      backgroundImage:
                          AssetImage('assets/images/users/placeholder.png'),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10.0,
                  right: 0,
                  child: Badge(
                    shape: BadgeShape.square,
                    animationType: BadgeAnimationType.scale,
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.2),
                    borderRadius: BorderRadius.circular(13.0),
                    borderSide: BorderSide(color: Colors.white, width: 2.0),
                    badgeColor: Colors.yellow[600],
                    elevation: 0,
                    badgeContent: Text(
                      'Gold',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 3.0),
                      child: Text(
                        'IDR',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      '17,7jt',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 23.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
