part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final Loginmodel loginModel;

  LoginSuccess({required this.loginModel});
}

class LoginFailure extends LoginState {}