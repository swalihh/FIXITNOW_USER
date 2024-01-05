import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'electrition_event.dart';
part 'electrition_state.dart';

class ElectritionBloc extends Bloc<ElectritionEvent, ElectritionState> {
  ElectritionBloc() : super(ElectritionInitial()) {
    on<ElectritionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
