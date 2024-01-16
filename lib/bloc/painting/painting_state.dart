part of 'painting_bloc.dart';

abstract class PaintingState {}

final class PaintingInitial extends PaintingState {}

class FetchAllPaintersSuccessState extends PaintingState {
  final List<ServicersModel> servicers;

  FetchAllPaintersSuccessState({required this.servicers});
}

class FetchAllPaintersErrorState extends PaintingState {
  final String message;

  FetchAllPaintersErrorState({required this.message});
}

class FetchAllPaintersLoadingStateState extends PaintingState {}
