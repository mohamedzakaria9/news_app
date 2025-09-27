import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/customWidgits/CustomElevatedButton.dart';
import 'package:new_app/utiles/AppImages.dart';
import 'package:new_app/utiles/AppRoutes.dart';

import '../../utiles/AppFonts.dart';
import 'cubit/onboarding_cubit.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  static String routeName = "onboarding";

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final pages = [
      Image.asset(AppImages.onBoardingImage_1,fit: BoxFit.cover,),
      Image.asset(AppImages.onBoardingImage_2,fit: BoxFit.cover,),
      Image.asset(AppImages.onBoardingImage_3,fit: BoxFit.cover,),
    ];
    final icons = [
      AppImages.onBoardingIcon_1,
      AppImages.onBoardingIcon_2,
      AppImages.onBoardingIcon_3,
    ];

    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      //here it update the index of the page
                      context.read<OnboardingCubit>().onPageChanged(index);
                    },
                    children: pages,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  height: height*0.35,
                  padding: EdgeInsets.symmetric(horizontal: width*0.05,vertical: height*0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lorem Ipsum is simply dummy",
                        style: AppFonts.bold24Black,
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                        style: AppFonts.medium16Black,
                      ),
                      Expanded(child: Container()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(icons[state.currentPage]),
                          Row(
                            children: [
                              (state.currentPage > 0)
                                  ? TextButton(
                                      onPressed: () => _goToPreviousPage(
                                        context,
                                        state.currentPage,
                                      ),
                                      child: Text(
                                        "Back",
                                        style: AppFonts.medium16GreyScale,
                                      ),
                                    )
                                  : const SizedBox(),
                              CustomElevatedButton(
                                buttonTextStyle: AppFonts.medium16White,
                                buttonText: (state.currentPage < pages.length-1)
                                    ? "Next"
                                    : "Get Started",
                                onPressed: () {
                                  (state.currentPage < pages.length - 1)
                                      ? _goToNextPage(
                                          context,
                                          state.currentPage,
                                          pages.length,
                                        )
                                      : Navigator.pushReplacementNamed(
                                          context,
                                          AppRoutes.loginScreen,
                                        );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextPage(BuildContext context, int currentPage, int totalPages) {
    if (currentPage < totalPages - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToPreviousPage(BuildContext context, int currentPage) {
    if (currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}
