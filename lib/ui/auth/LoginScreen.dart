import 'package:flutter/material.dart';
import 'package:new_app/customWidgits/CustomElevatedButton.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/ui/auth/cubit/login_screen_cubit.dart';
import 'package:new_app/utiles/AppImages.dart';
import '../../customWidgits/CustomTextFormField.dart';
import '../../utiles/AppColors.dart';
import '../../utiles/AppFonts.dart';
import '../../utiles/AppRoutes.dart';
import 'Validator.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "login";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$');

  @override
  Widget build(BuildContext context) {
    // print("i'm in the build");
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.05,
          horizontal: width * 0.05,
        ),
        child: Form(
          key: _formKey,
          child: BlocProvider(
            create: (context) => LoginScreenCubit(),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello", style: AppFonts.largeBold48Black),
                  Text("Again!", style: AppFonts.largeBold48MainColor),
                  Text(
                    "Welcome back you’ve\nbeen missed",
                    style: AppFonts.large20Black,
                  ),
                  SizedBox(height: height * 0.05),
                  Customtextformfield(
                    prefixIcon: "prefixIcon",
                    labelText: "UserName",
                    validate:Validators.validateEmail,
                  ),
                  SizedBox(height: height * 0.02),
                  BlocBuilder<LoginScreenCubit, LoginScreenState>(
                    //this rebuild the password only when it's changed
                    buildWhen: (previous, current) =>
                        previous.isPasswordVisible != current.isPasswordVisible,
                    builder: (context, state) {
                      // print("i'm in the blocBulder of the password");
                      return Customtextformfield(
                        prefixIcon: "prefixIcon",
                        labelText: "Password",
                        password: state.isPasswordVisible!,
                        validate: Validators.validatePassword,
                        isSuffixIcon: true,
                        suffixIcon: AppImages.passwordIcon,
                        suffixIconTap: () {
                          context
                              .read<LoginScreenCubit>()
                              .togglePasswordVisibility();
                          // print(
                          //   "i'm in the suffixIconTap and this is the password state${state.isPasswordVisible}",
                          // );
                        },
                      );
                    },
                  ),
                  SizedBox(height: height * 0.03),
                  Row(
                    children: [
                      BlocBuilder<LoginScreenCubit, LoginScreenState>(
                        //this rebuild the check box only if it's changed
                        buildWhen: (previous, current) =>
                            previous.isRememberMe != current.isRememberMe,
                        builder: (context, state) {
                          // print("I'm in the checkBox Field");
                          return Checkbox(
                            value: state.isRememberMe,
                            onChanged: (value) {
                              context.read<LoginScreenCubit>().toggleRememberMe();
                            },
                          );
                        },
                      ),
                      Text("Remember me", style: AppFonts.small14GreyScale),
                      Spacer(flex: 1),
                      InkWell(
                        onTap: () {
                          ///todo: navigate to forget password screen
                        },
                        child: Text(
                          "Forget the password?",
                          style: AppFonts.small14MainColor,
                        ),
                      ),
                    ],
                  ),
                  CustomElevatedButton(
                    buttonText: "Login",
                    buttonTextStyle: AppFonts.medium16White,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.homeRoute,
                        );
                      }
                    },
                  ),
                  SizedBox(height: height * 0.015),
                  Center(
                    child: Text(
                      "or continue with",
                      style: AppFonts.small14GreyScale,
                    ),
                  ),
                  SizedBox(height: height * 0.015),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomElevatedButton(
                        size: Size(width * 0.38, height * 0.05),
                        borderColor: AppColors.transparent,
                        buttonColor: AppColors.offWhite,
                        buttonText: "FaceBook",
                        buttonTextStyle: AppFonts.medium16GreyScale,
                        leadingIcon: Image.asset(AppImages.facebookImage),
                        onPressed: () {
                          ///todo: login with facebook
                        },
                      ),
                      CustomElevatedButton(
                        size: Size(width * 0.38, height * 0.05),
                        borderColor: AppColors.transparent,
                        buttonColor: AppColors.offWhite,
                        buttonText: "Google",
                        buttonTextStyle: AppFonts.medium16GreyScale,
                        leadingIcon: Image.asset(AppImages.googleImage),
                        onPressed: () {
                          ///todo: login with Google
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.015),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: AppFonts.small14GreyScale,
                      ),
                      SizedBox(width: width * 0.02),
                      InkWell(
                        onTap: (){
                          ///todo: navigate to sign up screen
                        },
                        child: Text(
                          "Sign Up",
                          style: AppFonts.semiBold14MainColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
