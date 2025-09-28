import 'package:flutter/material.dart';
import 'package:new_app/ui/home_screen/HomeScreen.dart';
import 'package:new_app/ui/auth/LoginScreen.dart';
import 'package:new_app/ui/home_screen/home_page/details_screen/DetailsScreen.dart';
import 'package:new_app/ui/onbording_screen/OnBoardingScreen.dart';
import 'package:new_app/utiles/AppRoutes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
        AppRoutes.detailsScreen:(context)=>DetailsScreen(),
      },
    );
  }
}