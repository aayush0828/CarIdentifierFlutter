import 'package:flutter/material.dart';

class CustomImageView extends StatelessWidget {
  final String imagePath;
  final double height;
  final double width;
  final EdgeInsetsGeometry margin;

  const CustomImageView({
    required this.imagePath,
    required this.height,
    required this.width,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Image.asset(
        imagePath,
        height: height,
        width: width,
        fit: BoxFit.cover, // Adjust the BoxFit as needed
        errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
          // Handle error, e.g., show a placeholder image or an error message
          return Image.asset(
            'assets/images/error_placeholder.png', // Replace with your error image
            height: height,
            width: width,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
