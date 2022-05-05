import 'package:drone_app_challenge/screens/drone_details/drone_details_screen.dart';
import 'package:drone_app_challenge/screens/drone_feature/drone_feature_screen.dart';
import 'package:drone_app_challenge/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DroneFeatureScreen(),
    );
  }
}
