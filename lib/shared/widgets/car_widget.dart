import 'package:flutter/material.dart';

import '../../core.dart';

Widget buildCar(Car car, [int index]) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(
        Radius.circular(15.0),
      ),
    ),
    padding: EdgeInsets.all(16.0),
    margin: EdgeInsets.only(
        right: index != null ? 16.0 : 0.0, left: index == 0 ? 16.0 : 0.0),
    width: 220.0,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            decoration: BoxDecoration(
              color: kPrimaryColorShadow,
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Text(
                car.condition,
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10.0),
        Container(
          height: 115.0,
          child: Center(
            child: Hero(
              tag: car.model,
              child: Image.asset(
                car.images[0],
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
        SizedBox(height: 24.0),
        Text(
          car.model,
          style: TextStyle(fontSize: 18.0),
        ),
        SizedBox(height: 8.0),
        Text(
          car.brand,
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            height: 1.0,
          ),
        ),
        Text(
          "per" +
              (car.condition == "Daily"
                  ? "Day"
                  : car.condition == "Weekly"
                      ? "week"
                      : "month"),
        ),
      ],
    ),
  );
}
