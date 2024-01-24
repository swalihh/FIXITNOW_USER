import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/models/servicemodels.dart';
import 'package:userapp/repositories/bookingrepo.dart';
part 'popularser_event.dart';
part 'popularser_state.dart';

class PopularserBloc extends Bloc<PopularserEvent, PopularserState> {
  PopularserBloc() : super(PopularserInitial()) {
    on<GetPopularServiceData>(fetchData);
  }

  FutureOr<void> fetchData(
      GetPopularServiceData event, Emitter<PopularserState> emit) async {
    emit(GetPopularServiceLoadingState());

    final datas = await BookingRepo().getPopular();

    datas.fold(
        (error) =>
            emit(GetPopularServiceDataErrorState(message: error.message)),
        (responce) {
      final List popular = responce['data'];
      List<ServicersModel> popularList =
          popular.map((e) => ServicersModel.fromJson(e)).toList();
      emit(GetPopularServiceDataSuccessState(popular: popularList));
    });
  }


}
