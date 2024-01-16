part of 'cleaning_bloc.dart';

sealed class CleaningState {}

final class CleaningInitial extends CleaningState {}
class GetAllCleaningServicersSuccessState extends CleaningState{
  final List<ServicersModel>servicers;

  GetAllCleaningServicersSuccessState({required this.servicers});
}
class GetAllCleaningServicersErrorState extends CleaningState{
  final String message;

  GetAllCleaningServicersErrorState({required this.message});
}
class GetAllCleaningServicersLoadingState extends CleaningState{}


