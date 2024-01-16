part of 'electrition_bloc.dart';

abstract class ElectritionState {}

final class ElectritionInitial extends ElectritionState {}

class FetchAllElectritionsDataSuccess extends ElectritionState {
  final List<ServicersModel> servicers;

  FetchAllElectritionsDataSuccess({required this.servicers});
}

class FetchAllElectritionsDataError extends ElectritionState {
  final String message;

  FetchAllElectritionsDataError({required this.message});
}

class FetchAllElectritionsDataLoadingState extends ElectritionState {}
