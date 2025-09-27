part of 'login_screen_cubit.dart';

sealed class LoginScreenState {
  bool isPasswordVisible;
  bool isRememberMe;

  LoginScreenState({this.isPasswordVisible = true, this.isRememberMe = false});
}

final class LoginScreenInitial extends LoginScreenState {
  LoginScreenInitial() : super();
}

final class LoginScreenPasswordVisibility extends LoginScreenState {
  LoginScreenPasswordVisibility(bool isPasswordVisible, bool isRememberMe)
    : super(isPasswordVisible: isPasswordVisible, isRememberMe: isRememberMe);
}

final class LoginScreenRememberMe extends LoginScreenState {
  LoginScreenRememberMe(bool isPasswordVisible, bool isRememberMe)
    : super(isPasswordVisible: isPasswordVisible, isRememberMe: isRememberMe);
}
