part of 'payment_bloc.dart';

abstract class PaymentEvent {}


class FetchPaymentDetailsEvent extends PaymentEvent{

final dynamic bookingid;
final BuildContext context;

  FetchPaymentDetailsEvent(this.context, {required this.bookingid});

}