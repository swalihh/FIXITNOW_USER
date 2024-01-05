import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/bloc/plumbing/plumbing_bloc.dart';
import 'package:userapp/models/servicemodels.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this.plumbing) : super(SearchInitial()) {

    on<GetAllServicersEvent>(getservicers);
  }
  final PlumbingBloc plumbing;
  List <ServicersModel>filteredList=[];
  

  FutureOr<void> getservicers(
      GetAllServicersEvent event, Emitter<SearchState> emit) {
        filteredList=plumbing.servicers!;
        if(event.value==''){
          emit(GetSearchSuccessState(servicersFilterdList: plumbing.servicers!));
        }
        if(event.value!=''){
          filteredList=
          filteredList.where((element) => element.location.toLowerCase().contains(event.value.toLowerCase())).toList();
         emit(GetSearchSuccessState(servicersFilterdList: filteredList));
        }

      }
}
