import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/models/servicemodels.dart';
import 'package:userapp/repositories/bookingrepo.dart';

part 'cleaning_event.dart';
part 'cleaning_state.dart';

class CleaningBloc extends Bloc<CleaningEvent, CleaningState> {
  CleaningBloc() : super(CleaningInitial()) {
    on<CleaningEvent>(getcleaning);
  }
  List<ServicersModel> servicers = [];

  FutureOr<void> getcleaning(
      CleaningEvent event, Emitter<CleaningState> emit) async {
    emit(GetAllCleaningServicersLoadingState());
    final data = await BookingRepo().getcleaning();
    data.fold(
        (error) =>
            emit(GetAllCleaningServicersErrorState(message: error.message)),
        (responce) {
      final List servicersList = responce['data'];
      servicers = servicersList.map((e) => ServicersModel.fromJson(e)).toList();
      emit(GetAllCleaningServicersSuccessState(servicers: servicers));
    });
  }
}
