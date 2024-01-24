import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

part 'razorpay_event.dart';
part 'razorpay_state.dart';

class RazorpayBloc extends Bloc<RazorpayEvent, RazorpayState> {
  RazorpayBloc() : super(RazorpayInitial()) {
    on<RazorpayStartEvent>(paymentStartEvent);
    on<RazorpaySuccessEvent>(paymentSuccessEvent);
    on<RazorpayFailerEvent>(paymentFailedEvent);
  }

  final _razorpay = Razorpay();

  FutureOr<void> paymentStartEvent(
      RazorpayStartEvent event, Emitter<RazorpayState> emit) {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    final amount = event.amount;

    var options = {
      'key': 'rzp_test_ZXYSTfNTl2yT5F',
      'amount': amount * 100,
      'name': 'FIXITNOW',
      'description': '',
      'prefill': {'contact': "1234567890", 'email': 'testRazorPay@gmail.com'}
    };
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.open(options);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
 
    add(RazorpaySuccessEvent());
  }

  void _handlePaymentError(PaymentFailureResponse response) {
   
    add(RazorpayFailerEvent());
  }

  FutureOr<void> paymentSuccessEvent(
      RazorpaySuccessEvent event, Emitter<RazorpayState> emit) {
        emit(RazorpaySuccessState());
  }

  FutureOr<void> paymentFailedEvent(
      RazorpayFailerEvent event, Emitter<RazorpayState> emit) {
    emit(RazorpayFailedState());
  }
}
