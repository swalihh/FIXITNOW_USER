part of 'bookinglist_bloc.dart';

sealed class BookinglistState {}

final class BookinglistInitial extends BookinglistState {}

class FetchBookingSuccessState extends BookinglistState {
  final List<BookingModel> bookings;

  FetchBookingSuccessState({required this.bookings});
}

class FetchBookingErrorState extends BookinglistState {
  final String message;

  FetchBookingErrorState({required this.message});
}

class FetchBookingLoadingState extends BookinglistState {}
