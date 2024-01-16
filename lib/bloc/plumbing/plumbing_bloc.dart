import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/models/servicemodels.dart';
import 'package:userapp/repositories/authentication.dart';
part 'plumbing_event.dart';
part 'plumbing_state.dart';

class PlumbingBloc extends Bloc<PlumbingEvent, PlumbingState> {
  PlumbingBloc() : super(PlumbingInitial()) {
    on<PlumbingEvent>(plumberData);
  }
  List<ServicersModel>? servicers;
  FutureOr<void> plumberData(
      PlumbingEvent event, Emitter<PlumbingState> emit) async {
    final plumberDetails = await AuthRepo().fetchPlumber();
    plumberDetails.fold(
        (error) => emit(PlumberDatafetchErrorState(message: error.message)),
        (responce) {
      final List servicersList = responce['data'];
      servicers = servicersList.map((e) => ServicersModel.fromJson(e)).toList();

      emit(PlumberDatafetchIsLoadingState());
      emit(PlumberDatafetchSuccessState(servicers: servicers!));
    });
  }
}
