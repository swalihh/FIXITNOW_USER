
import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/repositories/authentication.dart';
part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc() : super(BookingInitial()) {
    on<ServiceBookEvent>(servicerBooking);
   
  }

  FutureOr<void> servicerBooking(ServiceBookEvent event, Emitter<BookingState> emit) async{
      emit(ServiceBookingLoadingState());
      final data= await AuthRepo().bookservicer(event.map);
      data.fold((left) => 
      emit(ServiceBookingErrorState(message:left.message ))
      , (responce){

        emit(ServiceBookingSuccessState());
      });


    
  }
}
