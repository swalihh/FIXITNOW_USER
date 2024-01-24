import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/repositories/bookingrepo.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(PaymentInitial()) {
    on<FetchPaymentDetailsEvent>(fetchPaymentData);
  }

  FutureOr<void> fetchPaymentData(
      FetchPaymentDetailsEvent event, Emitter<PaymentState> emit) async {
    emit(FetchPaymentDetailsLoadingState());
    final data = await BookingRepo().getPaymentData(event.bookingid);
    data.fold(
        (error) => emit(FetchPaymentDetailsErrorState(message: error.message)),
        (responce) {
      

      emit(FetchPaymentDetailsSuccessState(
          startingTime: 
              responce['data']['startingtime'],
          endingTime:
           responce['data']['endingtime'],
          revenue: responce['data']['revenue']));
    });
  }
}
