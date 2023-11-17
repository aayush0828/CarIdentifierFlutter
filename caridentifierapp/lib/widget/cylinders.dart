import 'package:caridentifierapp/car_model.dart';
import 'package:caridentifierapp/widget/customimageview.dart';
import 'package:flutter/material.dart';

class CylindersItemWidget extends StatelessWidget {
  final CarModel car;

  CylindersItemWidget({required this.car, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 37,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        color: Colors.blue, // Replace with your desired color
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: "assets/images/cylinder.png",  // Use car model property for image path
            height: 60.0,
            width: 60.0,
            margin: EdgeInsets.only(left: 9.0),
          ),
          SizedBox(height: 20.0),
          Text(
            "Cylinders: ${car.cylinders}",  // Use car model property for cylinders
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 11.0),
        ],
      ),
    );
  }
}
