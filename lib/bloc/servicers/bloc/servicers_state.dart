part of 'servicers_bloc.dart';

abstract class ServicersState {}

final class ServicersInitial extends ServicersState {}


class FetchingServicersSuccessState extends ServicersState{

  final  List<ServicersModel> servicers;

  FetchingServicersSuccessState({required this.servicers});

}
class FetchingAllServicersErrorState extends ServicersState{
 final String message;

  FetchingAllServicersErrorState({required this.message});
}