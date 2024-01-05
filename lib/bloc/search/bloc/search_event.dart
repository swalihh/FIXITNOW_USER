part of 'search_bloc.dart';

abstract class SearchEvent {}

class GetAllServicersEvent extends SearchEvent{

  final String value;

  GetAllServicersEvent({required this.value}); 
}