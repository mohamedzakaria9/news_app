import 'package:flutter/material.dart';
import 'package:new_app/ui/home_screen/home_page/HomePage.dart';
import 'package:new_app/ui/home_screen/profile_page/ProfilePage.dart';
import 'package:new_app/ui/home_screen/search_page/BrowsePage.dart';
import 'package:new_app/utiles/AppFonts.dart';
import 'package:new_app/utiles/AppImages.dart';

import '../../utiles/AppColors.dart';
import 'bookmarkPage/BookmarkPage.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final pages = [HomePage(), BrowsePage(), BookmarkPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(AppImages.logoAppbar),
        actions: [
          Icon(Icons.notifications_none),
          SizedBox(width: width * 0.03),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: AppColors.greyScaleColor,
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        items: [
          bottomNavigationBarItem(
            icon: AppImages.homeIcon,
            label: "Home",
          ),
          bottomNavigationBarItem(
            icon: AppImages.browseIcon,
            label: "Explore",
          ),
          bottomNavigationBarItem(
            icon: AppImages.bookmarkIcon,
            label: "Bookmark",
          ),
          bottomNavigationBarItem(
            icon: AppImages.profileIcon,
            label: "Profile",
          ),
        ],
      ),
      body: pages[currentIndex],
    );
  }

  BottomNavigationBarItem bottomNavigationBarItem({
    required String icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: ImageIcon(AssetImage(icon)),
      label: label,
    );
  }
}
