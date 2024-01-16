part of 'search_bloc.dart';

abstract class SearchEvent {}



class SearchShowAllEvent extends SearchEvent {}

class SearchServicersEvent extends SearchEvent {
 
  final String? query;
  final List<String> servicersList;
  final double? priceRange;
  SearchServicersEvent(
      {required this.query,
      required this.servicersList,
      required this.priceRange});
}