part of 'search_bloc.dart';

abstract class SearchState {}

final class SearchInitial extends SearchState {}

final class GetSearchSuccessState extends SearchState{
 final  List <ServicersModel>servicersFilterdList;

  GetSearchSuccessState({required this.servicersFilterdList});
}


