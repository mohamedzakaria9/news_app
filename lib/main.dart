import 'package:flutter/material.dart';
import 'package:new_app/ui/HomeScreen.dart';
import 'package:new_app/ui/OnBoardingScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: OnBoardingScreen.routeName,
      routes: {
        HomeScreen.routeName : (context)=>HomeScreen(),
        OnBoardingScreen.routeName : (context)=>OnBoardingScreen(),
      },
    );
  }
}


