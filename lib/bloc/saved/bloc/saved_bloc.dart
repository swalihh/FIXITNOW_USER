import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/models/savedmodel.dart';
import 'package:userapp/repositories/bookingrepo.dart';

part 'saved_event.dart';
part 'saved_state.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {
  SavedBloc() : super(SavedInitial()) {
    on<AddToSavedEvent>(saved);
    on<RemoveFromEvent>(remove);
    on<GetSavedEvent>(getsaved);
  }
  List<SavedModel> saveds = []; 

   FutureOr<void> getsaved(GetSavedEvent event, Emitter<SavedState> emit) async {
    final details = await BookingRepo().getSaved();
    details.fold((left) => emit(GetSavedErrorState()), (responce) {
    
         List savedList =[];
    savedList   = responce['data']??[];
        saveds = savedList.map((e) => SavedModel.fromJson(e)).toList();
        emit(GetSavedDataSuccessState(savedList: saveds));   
      
    
    });
  }

  FutureOr<void> saved(AddToSavedEvent event, Emitter<SavedState> emit) async {
  
    final details = await BookingRepo().saveservicer(event.id);
    details.fold((left) => emit(SavedDataErrorState()), (responce) {
      emit(SavedDataSuccessState()); 
       add(GetSavedEvent());
       emit(GetSavedDataSuccessState(savedList: saveds));  
    });
  }

//==================================remove======================================
  FutureOr<void> remove(RemoveFromEvent event, Emitter<SavedState> emit) async {
       saveds.removeWhere((element) => element.wishlistId==event.savedid);
      emit(GetSavedDataSuccessState(savedList: saveds));
    final details = await BookingRepo().removeServicer(event.savedid);
    details.fold((left) => emit(SavedDataRemoveErrorState()), (responce) {
     
    
    });
  }

//     ======================================================getsaved============================
 
}
