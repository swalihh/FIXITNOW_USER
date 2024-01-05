import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/models/usermodel.dart';
import 'package:userapp/repositories/authentication.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserDataFetchEvent>(getUser);
  }

  FutureOr<void> getUser(
      UserDataFetchEvent event, Emitter<UserState> emit) async {
    final userDetails = await AuthRepo().getuserDetails();
    userDetails
        .fold((error) => emit(UserDataFetchErrorState(message: error.message)),
            (responce) {
              print(responce);
      final Rawdata = responce['data'];

      final UserModel user = UserModel.fromJson(Rawdata);
      emit(UserDataLoadingState());
      emit(UserDataFetchSuccessState(user: user));
    });
  }
}
