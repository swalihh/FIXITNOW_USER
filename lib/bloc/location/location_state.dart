part of 'location_bloc.dart';

abstract class LocationState {}

final class LocationInitial extends LocationState {}
class LocaionPickedSuccess extends LocationState{
final  Map<dynamic, dynamic> locationdata;

  LocaionPickedSuccess({required this.locationdata});
}

class LocaionPickedLoading extends LocationState{}

class LocaionPickedFailed extends LocationState{
  final String message;

  LocaionPickedFailed({required this.message});
}