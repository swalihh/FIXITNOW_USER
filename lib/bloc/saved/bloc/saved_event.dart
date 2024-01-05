part of 'saved_bloc.dart';

abstract class SavedEvent {}

class AddToSavedEvent extends SavedEvent {
  final dynamic id;

  AddToSavedEvent({required this.id});
}

class GetSavedEvent extends SavedEvent {}

class RemoveFromEvent extends SavedEvent {
  final int savedid;

  RemoveFromEvent({required this.savedid});
}
