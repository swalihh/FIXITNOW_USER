part of 'saved_bloc.dart';

sealed class SavedState {}

final class SavedInitial extends SavedState {}


class SavedDataSuccessState extends SavedState{

}
class SavedDataErrorState extends SavedState{
  
}
class SavedRemoveDataSuccessState extends SavedState{

}
class SavedDataRemoveErrorState extends SavedState{
  
}
class GetSavedDataSuccessState extends SavedState{

final List<SavedModel>savedList;

  GetSavedDataSuccessState({required this.savedList});

}
class GetSavedErrorState extends SavedState{
  
}
class GetSavedEmptyState extends SavedState{
  
}