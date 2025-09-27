part of 'login_screen_cubit.dart';

class LoginScreenState {
  bool isPasswordVisible;
  bool isRememberMe;

  LoginScreenState({
    this.isRememberMe = false,
    this.isPasswordVisible = true,
  });

  LoginScreenState copyWith({
    bool? isPasswordVisible,
    bool? isRememberMe,
  }) {
    return LoginScreenState(
      isRememberMe: isRememberMe ?? this.isRememberMe,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible
    );
  }
}
