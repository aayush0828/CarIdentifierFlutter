import 'dart:io';
import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

class ResultPage extends StatefulWidget {
  final File image;

  ResultPage({required this.image});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String result = '';

  @override
  void initState() {
    super.initState();
    doImageClassification();
  }

  void doImageClassification() async {
    String? output = await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
      numThreads: 1,
      isAsset: true,
      useGpuDelegate: false,
    );
    print(output);

    List? recognition = await Tflite.runModelOnImage(
      path: widget.image.path,
      imageMean: 0.0,
      imageStd: 255.0,
      numResults: 2,
      threshold: 0.1,
      asynch: true,
    );

    if (recognition != null) {
      String tempResult = '';

      recognition.forEach((element) {
        print(element.toString());
        tempResult += element["label"].toString();
      });

      setState(() {
        result = tempResult;
      });
    }
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Result'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Identified Car: $result',
            style: TextStyle(fontSize: 24),
          ),
          // Display the selected or captured image
          Image.file(widget.image),
        ],
      ),
    ),
  );
}
}