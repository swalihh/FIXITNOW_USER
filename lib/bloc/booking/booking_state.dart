part of 'booking_bloc.dart';

abstract class BookingState {}

final class BookingInitial extends BookingState {}

class ServiceBookingSuccessState extends BookingState {}

class ServiceBookingErrorState extends BookingState {
  final String message;

  ServiceBookingErrorState({required this.message});
}
class ServiceBookingLoadingState extends BookingState {}

