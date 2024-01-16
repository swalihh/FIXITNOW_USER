import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/models/servicemodels.dart';
import 'package:userapp/repositories/bookingrepo.dart';

part 'painting_event.dart';
part 'painting_state.dart';

class PaintingBloc extends Bloc<PaintingEvent, PaintingState> {
  PaintingBloc() : super(PaintingInitial()) {
    on<PaintingEvent>(getpainters);
  }
  List<ServicersModel> servicers = [];

  FutureOr<void> getpainters(
      PaintingEvent event, Emitter<PaintingState> emit) async {
    emit(FetchAllPaintersLoadingStateState());
    final details = await BookingRepo().getpaintings();

    details.fold(
        (error) => emit(FetchAllPaintersErrorState(message: error.message)),
        (responce) {
      final List paintersList = responce['data'];
      servicers = paintersList.map((e) => ServicersModel.fromJson(e)).toList();
      emit(FetchAllPaintersSuccessState(servicers: servicers));
    });
  }
}
