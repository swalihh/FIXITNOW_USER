import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/bloc/servicers/bloc/servicers_bloc.dart';
import 'package:userapp/models/servicemodels.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this.servicerBlocObj) : super(SearchInitial()) {
    on<SearchServicersEvent>(getservicers);
  }
  final ServicersBloc servicerBlocObj;
 

  FutureOr<void> getservicers(
      SearchServicersEvent event, Emitter<SearchState> emit) {
    List<ServicersModel> filteredServicers = [];
    List<String> categories = [];
    double priceRange;

    priceRange = event.priceRange == null ? 15000 : event.priceRange!;

    if (event.servicersList.isEmpty) {
      categories = [
        'Plumber',
        'Electrician',
        'Cleaning',
        'Painting',
        'Cooking',
        'Others'
      ];
    } else {
      categories = event.servicersList;
    }

    List<ServicersModel> totalServicers = servicerBlocObj.allServicersList!;
    if (event.query == null &&
        event.servicersList.isEmpty &&
        event.priceRange == null) {
      emit(SearchFoundState(filteredServicers: totalServicers));
    } else {
      filteredServicers = totalServicers.where((e) {
        for (int i = 0; i < categories.length; i++) {
          double price = double.parse(e.amount.toString());
          if (e.serviceCategory.contains(categories[i]) &&
              price <= priceRange) {
            return true;
          }
        }
        return false;
      }).toList();

      if (event.query != null) {
        filteredServicers = filteredServicers
            .where((e) =>
                e.location.toLowerCase().contains(event.query!.toLowerCase())||e.username.toLowerCase().contains(event.query!.toLowerCase()))
            .toList();
        if (filteredServicers.isNotEmpty) {
          emit(SearchFoundState(filteredServicers: filteredServicers));
        } else if (filteredServicers.isEmpty) {
          emit(SearchNotFoundState());
        }
      } else if (event.query == null && filteredServicers.isNotEmpty) {
        emit(SearchNotFoundState());
      }
    }
   
  }
}

