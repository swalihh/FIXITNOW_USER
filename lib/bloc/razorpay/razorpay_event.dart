part of 'razorpay_bloc.dart';


abstract class RazorpayEvent {}

final class RazorpayStartEvent extends RazorpayEvent{
  final int amount;

  RazorpayStartEvent({required this.amount});
}

final class RazorpaySuccessEvent extends RazorpayEvent{}

final class RazorpayErrorEvent extends RazorpayEvent{}

final class RazorpayFailerEvent extends RazorpayEvent{}
