import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/models/servicemodels.dart';
import 'package:userapp/repositories/bookingrepo.dart';
part 'electrition_event.dart';
part 'electrition_state.dart';

class ElectritionBloc extends Bloc<ElectritionEvent, ElectritionState> {
  ElectritionBloc() : super(ElectritionInitial()) {
       on<ElectritionEvent>(fetchElectrions);

  }
    List<ServicersModel> servicers=[];

  FutureOr<void> fetchElectrions(
      ElectritionEvent event, Emitter<ElectritionState> emit) async{
    emit(FetchAllElectritionsDataLoadingState());

    final electritiondata =await BookingRepo().getElectritions();
    electritiondata.fold(
        (error) => emit(FetchAllElectritionsDataError(message: error.message)),
        (responce) {

          final List servicersList=responce['data'];

          servicers=servicersList.map((e) => ServicersModel.fromJson(e)).toList();
          emit(FetchAllElectritionsDataSuccess(servicers: servicers));

        });
  }
}
