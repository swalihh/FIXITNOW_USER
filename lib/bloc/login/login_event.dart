part of 'login_bloc.dart';

abstract class LoginEvent {}

class UserLoginEvent extends LoginEvent {
  final String password;
final String email;

  UserLoginEvent({required this.password, required this.email});
}
