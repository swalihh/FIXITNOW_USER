part of 'popularser_bloc.dart';

abstract class PopularserState {}

final class PopularserInitial extends PopularserState {}

class GetPopularServiceDataSuccessState extends PopularserState{
    final List<ServicersModel> popular;

  GetPopularServiceDataSuccessState({required this.popular});

}
class GetPopularServiceLoadingState extends PopularserState{}

class GetPopularServiceDataErrorState extends PopularserState{
  final String message;

  GetPopularServiceDataErrorState({required this.message});
}


