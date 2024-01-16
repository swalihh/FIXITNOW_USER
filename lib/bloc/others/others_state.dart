part of 'others_bloc.dart';

sealed class OthersState {}

final class OthersInitial extends OthersState {}

class GetAllOtherServicersSuccessState extends OthersState {
  final List<ServicersModel> servicers;

  GetAllOtherServicersSuccessState({required this.servicers});
}
class GetAllOtherServicersErrorState extends OthersState {
final String message;

  GetAllOtherServicersErrorState({required this.message});
}
class GetAllOtherServicersLoadingState extends OthersState {

}