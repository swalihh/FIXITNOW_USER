part of 'search_bloc.dart';

abstract class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchFoundState extends SearchState {
  final List<ServicersModel> filteredServicers;

  SearchFoundState({required this.filteredServicers});
}

final class SearchNotFoundState extends SearchState {}

final class SearchShowAllServicersState extends SearchState {
  final List<ServicersModel> totalServicers;

  SearchShowAllServicersState({required this.totalServicers
  });
}

