import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/models/bookimgsmodel.dart';
import 'package:userapp/repositories/bookingrepo.dart';

part 'bookinglist_event.dart';
part 'bookinglist_state.dart';

class BookinglistBloc extends Bloc<BookinglistEvent, BookinglistState> {
  BookinglistBloc() : super(BookinglistInitial()) {
    on<GetAllBookingDetailsEvent>(getbookings);
  }

  FutureOr<void> getbookings(
      GetAllBookingDetailsEvent event, Emitter<BookinglistState> emit) async {
    emit(FetchBookingLoadingState());

    final details = await BookingRepo().getAllBookings();

    details
        .fold((error) => emit(FetchBookingErrorState(message: error.message)),
            (responce) {
      final List bookingsList = responce['data'];

      List<BookingModel> bookings =
          bookingsList.map((e) => BookingModel.fromJson(e)).toList();

      emit(FetchBookingSuccessState(bookings: bookings));
    });
  }
}
