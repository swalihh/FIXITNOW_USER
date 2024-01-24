part of 'razorpay_bloc.dart';


abstract class RazorpayState {}

final class RazorpayInitial extends RazorpayState {}

final class RazorpaySuccessState extends RazorpayState{}

final class RazorpayFailedState extends RazorpayState{}