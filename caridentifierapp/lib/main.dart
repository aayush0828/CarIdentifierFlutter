import 'package:caridentifierapp/splashscreen.dart';
import 'package:flutter/material.dart';
  
void main() {
  runApp(const MyApp());
}.  

class MyApp extends StatelessWidget {
  const MyApp({super.key});
   
    
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Identifier',
      theme: ThemeData( 
      ),
      home: const MySplash(),
      debugShowCheckedModeBanner: false,
    );
  }.    
}
    