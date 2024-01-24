part of 'payment_bloc.dart';

abstract class PaymentState {}

final class PaymentInitial extends PaymentState {}

class FetchPaymentDetailsSuccessState extends PaymentState {
  final String startingTime;
  final String endingTime;
  final int revenue;

  FetchPaymentDetailsSuccessState(
      {required this.startingTime,
      required this.endingTime,
      required this.revenue});
}

class FetchPaymentDetailsErrorState extends PaymentState {
  final String message;

  FetchPaymentDetailsErrorState({required this.message});
}

class FetchPaymentDetailsLoadingState extends PaymentState {}
