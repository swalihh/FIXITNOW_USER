part of 'signup_bloc.dart';

abstract class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupSuccessState extends SignupState {}

final class SignupFailerState extends SignupState {}

final class SignupErrorState extends SignupState {
  final String message;

  SignupErrorState({required this.message});
}

final class SignupLoadingState extends SignupState {}

final class OtpMatchedState extends SignupState {}

final class OtpNotMatchedState extends SignupState {}
//----------------------------------------------------------userfetching------------//


