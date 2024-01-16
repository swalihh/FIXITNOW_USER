part of 'profileupdate_bloc.dart';

abstract class ProfileupdateEvent {}
class ProfileupdatingEvent extends ProfileupdateEvent{
final String username;
final String email;
final String phone;

  ProfileupdatingEvent({required this.username, required this.email, required this.phone});
}