
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/models/servicemodels.dart';
import 'package:userapp/repositories/bookingrepo.dart';

part 'servicers_event.dart';
part 'servicers_state.dart';

class ServicersBloc extends Bloc<ServicersEvent, ServicersState> {
  ServicersBloc() : super(ServicersInitial()) {
 on<FetchAllServicersEvent>(fetchAllServicers);
  }
   List<ServicersModel>?allServicersList;

  FutureOr<void> fetchAllServicers(FetchAllServicersEvent event, Emitter<ServicersState> emit) async{
   print('rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
    final data= await BookingRepo().getAllServicers();
    data.fold((error) => emit(FetchingAllServicersErrorState(message: error.message)), (response) {
      print('55555555555555555555555555555555555555555555555555555555555555555555555555555');
    allServicersList = List<ServicersModel>.from(
          response['accepted'].map((json) => ServicersModel.fromJson(json)),
        );

      print('55555555555555555555555555555555555555555555555555555555555555555555555555555');

      emit(FetchingServicersSuccessState(servicers: allServicersList!));

    });
  }
}
