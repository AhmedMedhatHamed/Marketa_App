part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState{}
class AuthSuccessState extends AuthState{}
class AuthErrorState extends AuthState{
  final String errorMsg;

  AuthErrorState(this.errorMsg);
}

class CheckBoxState extends AuthState{}

class PasswordVisibilityState extends AuthState{}

class SignInLoadingState extends AuthState{}
class SignInSuccessState extends AuthState{}
class SignInErrorState extends AuthState{
  final String errorMsg;

  SignInErrorState(this.errorMsg);
}

class ForgetPasswordLoadingState extends AuthState{}
class ForgetPasswordSuccessState extends AuthState{}
class ForgetPasswordErrorState extends AuthState{
  final String errorMsg;

  ForgetPasswordErrorState(this.errorMsg);
}



