import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  String? emailAddress;
  String? password;
  String? firstName;
  String? lastName;
  GlobalKey<FormState> signupFormKey = GlobalKey();
  bool? isCheckBoxActive = false;
  bool? isObscure = true;
  GlobalKey<FormState> signInFormKey = GlobalKey();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey();

  void updateStateOfCheckBox(dynamic newValue) {
    isCheckBoxActive = newValue;
    emit(CheckBoxState());
  }

  void togglePasswordVisibility() {
    isObscure = !isObscure!;
    emit(PasswordVisibilityState());
  }
}
