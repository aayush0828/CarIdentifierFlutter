import 'package:caridentifierapp/car_model.dart';
import 'package:caridentifierapp/widget/customimageview.dart';
import 'package:flutter/material.dart';

class TransmissionItemWidget extends StatelessWidget {
  final CarModel car; // Assuming CarModel is the class for your car data

  TransmissionItemWidget({required this.car, Key? key}) : super(key: key);

  String getTransmissionLabel(String transmission) {
    switch (transmission) {
      case 'm':
        return 'Manual';
      case 'a':
        return 'Automatic';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        // Assuming AppDecoration.fillPrimary is a BoxDecoration
        color: Colors.blue, // Replace with your desired color
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: "assets/images/transmission.png", // Use car properties
            height: 60.0,
            width: 60.0,
            margin: EdgeInsets.only(left: 9.0),
          ),
          SizedBox(height: 20.0),
          Text(
            "Transmission: ${getTransmissionLabel(car.transmission)}", // Use car properties
            // Assuming theme is available through Theme.of(context).textTheme.titleSmall
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 11.0),
        ],
      ),
    );
  }
}
