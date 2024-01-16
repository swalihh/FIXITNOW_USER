import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/repositories/bookingrepo.dart';

part 'profileupdate_event.dart';
part 'profileupdate_state.dart';

class ProfileupdateBloc extends Bloc<ProfileupdateEvent, ProfileupdateState> {
  ProfileupdateBloc() : super(ProfileupdateInitial()) {
    on<ProfileupdatingEvent>(updateProfile);
  }

  FutureOr<void> updateProfile(
      ProfileupdatingEvent event, Emitter<ProfileupdateState> emit) async {
    emit(UpdateProfileLoadingState());

    final userDetails = {
      "username": event.username,
      "email": event.email,
      "phone": event.phone,
    };

    final data = await BookingRepo().updateProfile(userDetails);

    data.fold((error) => emit(UpdateProfileErrorState(message: error.message)),
        (responce) {
      emit(UpdateProfileSuccessState());
    });
  }
}
