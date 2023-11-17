import 'dart:io';
import 'package:caridentifierapp/searchpage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'resultpage.dart';
import 'featurebox.dart';

class MyHomePage extends StatelessWidget {
  final ImagePicker imagePicker = ImagePicker();

  Future<void> selectPhoto(BuildContext context) async {
    final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(image: File(pickedImage.path)),
        ),
      );
    }
  }

  Future<void> capturePhoto(BuildContext context) async {
    final takenImage = await imagePicker.pickImage(source: ImageSource.camera);
    if (takenImage != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(image: File(takenImage.path)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('CarInfo.Com'),
          leading: const Icon(Icons.menu),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  // Circular image container
                  Center(
                    child: Container(
                      height: 120,
                      width: 120,
                      margin: const EdgeInsets.only(top: 6),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade300,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  // Circular image
                  Container(
                    height: 125,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://cdn-icons-png.flaticon.com/512/21/21135.png'),
                      ),
                    ),
                  ),
                  // Greeting message container
                  Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 40,
                      ).copyWith(top: 30),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white38),
                        borderRadius: BorderRadius.circular(20)
                            .copyWith(topLeft: Radius.zero),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          'Hello, what task can I do for you?',
                          style: TextStyle(
                            fontFamily: 'Cera Pro',
                            color: Colors.blueGrey,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Extra container
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: const EdgeInsets.only(top: 10, left: 22),
                    alignment: Alignment.centerLeft,
                  ),
                ],
              ),
              // Feature boxes
              Column(
                children: [
                  FeatureBox(
                    color: Colors.blue.shade800,
                    headerText: 'Search a Car',
                    // Add a text search option
                    child: ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchCarPage()),
    );
  },
  child: Text('Search Cars'),
)
                  ),
                  FeatureBox(
                    color: Colors.cyan.shade800,
                    headerText: 'Take Picture',
                    // Option and icon for taking a picture
                    child: Column(
                      children: [
                        ElevatedButton.icon(
                          onPressed: () => capturePhoto(context),
                          icon: Icon(Icons.camera_alt),
                          label: Text('Take a Picture'),
                        ),
                        // Add additional options or text as needed
                      ],
                    ),
                  ),
                  FeatureBox(
                    color: Colors.lightBlue.shade800,
                    headerText: 'Select Picture',
                    // Option and icon for selecting an image from the gallery
                    child: Column(
                      children: [
                        ElevatedButton.icon(
                          onPressed: () => selectPhoto(context),
                          icon: Icon(Icons.photo),
                          label: Text('Select from Gallery'),
                        ),
                        // Add additional options or text as needed
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
