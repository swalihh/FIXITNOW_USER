import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/models/servicemodels.dart';
import 'package:userapp/repositories/bookingrepo.dart';
part 'cooking_event.dart';
part 'cooking_state.dart';

class CookingBloc extends Bloc<CookingEvent, CookingState> {
  CookingBloc() : super(CookingInitial()) {
    on<CookingEvent>(getCookingData);
  }
  List<ServicersModel> servicers = [];

  FutureOr<void> getCookingData(
      CookingEvent event, Emitter<CookingState> emit) async {
    emit(CookingDataFetchLoadingState());
    final data = await BookingRepo().getcooking();
    data.fold(
        (error) => emit(CookingDataFetchErrorState(message: error.message)),
        (responce) {
      final List servicersList = responce['data'];
      servicers = servicersList.map((e) => ServicersModel.fromJson(e)).toList();
      emit(CookingDataFetchSuccessState(servicers: servicers));
    });
  }
}
