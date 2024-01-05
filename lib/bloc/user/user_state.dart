part of 'user_bloc.dart';


abstract class UserState {}

final class UserInitial extends UserState {}
final class UserDataFetchSuccessState extends UserState {
  final UserModel user;

  UserDataFetchSuccessState({required this.user});


}

final class UserDataFetchFailerState extends UserState {}
final class UserDataLoadingState extends UserState {}


final class UserDataFetchErrorState extends UserState {
  final String message;

  UserDataFetchErrorState({required this.message});
}

