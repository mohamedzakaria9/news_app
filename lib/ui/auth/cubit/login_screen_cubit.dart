import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_screen_state.dart';

class LoginScreenCubit extends Cubit<LoginScreenState> {
  LoginScreenCubit() : super(LoginScreenState());
  void togglePasswordVisibility() {
    emit(LoginScreenState(isPasswordVisible: !state.isPasswordVisible));
  }
  void toggleRememberMe() {
    emit(LoginScreenState(isRememberMe: !state.isRememberMe));
  }
}
