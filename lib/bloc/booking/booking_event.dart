part of 'booking_bloc.dart';

abstract class BookingEvent {}

class ServiceBookEvent extends BookingEvent{

final Map map;

  ServiceBookEvent({required this.map});

}
