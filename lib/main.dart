import 'package:flutter/material.dart';
import 'package:new_app/ui/HomeScreen.dart';
import 'package:new_app/ui/auth/LoginScreen.dart';
import 'package:new_app/ui/onbording_screen/OnBoardingScreen.dart';
import 'package:new_app/utiles/AppRoutes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: OnBoardingScreen.routeName,
      routes: {
        AppRoutes.homeRoute : (context)=>HomeScreen(),
        AppRoutes.onBoardingRoute : (context)=>OnBoardingScreen(),
        AppRoutes.loginScreen : (context)=>LoginScreen(),
      },
    );
  }
}


