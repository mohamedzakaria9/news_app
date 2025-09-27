import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_screen_state.dart';

class LoginScreenCubit extends Cubit<LoginScreenState> {
  LoginScreenCubit() : super(LoginScreenInitial());
  void togglePasswordVisibility() {
    emit(LoginScreenPasswordVisibility(!state.isPasswordVisible, state.isRememberMe));
  }
  void toggleRememberMe() {
    emit(LoginScreenRememberMe(state.isPasswordVisible,!state.isRememberMe));
  }
}
