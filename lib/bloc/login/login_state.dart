part of 'login_bloc.dart';

abstract class LoginState {}

final class LoginInitial extends LoginState {}

class UserLoginSuccessState extends LoginState {}

class UserLoginErrorState extends LoginState {
  final String message;

  UserLoginErrorState({required this.message});
}

class UserLoginIsLoadingState extends LoginState {}
