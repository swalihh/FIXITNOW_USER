import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/models/servicemodels.dart';
import 'package:userapp/repositories/bookingrepo.dart';

part 'others_event.dart';
part 'others_state.dart';

class OthersBloc extends Bloc<OthersEvent, OthersState> {
  OthersBloc() : super(OthersInitial()) {
    on<OthersEvent>(otherServicers);
  }
  List<ServicersModel> servicers = [];

  FutureOr<void> otherServicers(
      OthersEvent event, Emitter<OthersState> emit) async {
    emit(GetAllOtherServicersLoadingState());
    final data = await BookingRepo().getothers();
    data.fold(
        (error) => emit(GetAllOtherServicersErrorState(message: error.message)),
        (responce) {
      final List servicersList = responce['data'];
      servicers = servicersList.map((e) => ServicersModel.fromJson(e)).toList();
      emit(GetAllOtherServicersSuccessState(servicers: servicers));
    });
  }
}
