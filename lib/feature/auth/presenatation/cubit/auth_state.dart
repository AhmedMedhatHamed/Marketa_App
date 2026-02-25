part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class CheckBoxState extends AuthState{}
class PasswordVisibilityState extends AuthState{}
