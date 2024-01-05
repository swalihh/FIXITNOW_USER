part of 'plumbing_bloc.dart';

sealed class PlumbingState {}

final class PlumbingInitial extends PlumbingState {}

final class PlumberDatafetchState extends PlumbingState{}
final class PlumberDatafetchErrorState extends PlumbingState{
  final String message;

  PlumberDatafetchErrorState({required this.message});
}
final class PlumberDatafetchIsLoadingState extends PlumbingState{}
final class PlumberDatafetchSuccessState extends PlumbingState{
   final List<ServicersModel> servicers;

  PlumberDatafetchSuccessState({required this.servicers});
}


