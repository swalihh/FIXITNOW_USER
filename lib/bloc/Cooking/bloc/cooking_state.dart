part of 'cooking_bloc.dart';

abstract class CookingState {}

final class CookingInitial extends CookingState {}

final class CookingDataFetchSuccessState extends CookingState {
  final List<ServicersModel> servicers;

  CookingDataFetchSuccessState({required this.servicers});
}

final class CookingDataFetchErrorState extends CookingState {
  final String message;

  CookingDataFetchErrorState({required this.message});
}

final class CookingDataFetchLoadingState extends CookingState {}
