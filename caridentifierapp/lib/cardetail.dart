// Import necessary libraries
import 'package:caridentifierapp/car_model.dart';
import 'package:caridentifierapp/widget/cylinders.dart';
import 'package:caridentifierapp/widget/drivewidget.dart';
import 'package:caridentifierapp/widget/fueltype.dart';
import 'package:caridentifierapp/widget/transmissionwidget.dart';
import 'package:flutter/material.dart';

class CarDetailPage extends StatelessWidget {
  final CarModel car;
 
  CarDetailPage({required this.car});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              // Car Image Section
              Container(
                width: double.maxFinite,
                height: 200, // Set the height as needed
                decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/images/mustang.png'), // Replace with the actual path
                  ),
                ),
              ),
              SizedBox(height: 17),
              Container(
                width: 356,
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 25,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  "${car.make.toUpperCase()} ${car.model.toUpperCase()} ${car.year}",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              SizedBox(height: 34),
              _buildThirteen(context, car),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildThirteen(BuildContext context, CarModel car) {
    List<Widget> widgets = [
      ThirteenItemWidget(car: car),
      DriveItemWidget(car: car),
      CylindersItemWidget(car: car),
      TransmissionItemWidget(car: car),
      // Add more widgets here
    ];

    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
          left: 18,
          right: 27,
        ),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: widgets.length,
          itemBuilder: (context, index) {
            return widgets[index];
          },
        ),
      ),
    );
  }
}
