part of 'profileupdate_bloc.dart';

abstract class ProfileupdateState {}

final class ProfileupdateInitial extends ProfileupdateState {}


class UpdateProfileSuccessState extends ProfileupdateState{}

class UpdateProfileErrorState extends ProfileupdateState{
  final String message;

  UpdateProfileErrorState({required this.message});
}

class UpdateProfileLoadingState extends ProfileupdateState{}
