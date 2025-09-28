import 'package:new_app/ui/home_screen/HomeScreen.dart';
import 'package:new_app/ui/auth/LoginScreen.dart';
import 'package:new_app/ui/home_screen/home_page/details_screen/DetailsScreen.dart';

import '../ui/onbording_screen/OnBoardingScreen.dart';

class AppRoutes{
  static final String homeRoute = HomeScreen.routeName;
  static final String onBoardingRoute = OnBoardingScreen.routeName;
  static final String loginScreen = LoginScreen.routeName;
  static final String detailsScreen = DetailsScreen.routeName;
}