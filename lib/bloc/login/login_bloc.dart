import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/bloc/user/user_bloc.dart';
import 'package:userapp/data/sharedpreference/sharedpreference.dart';
import 'package:userapp/repositories/authentication.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.userBloc) : super(LoginInitial()) {
    on<UserLoginEvent>(loginUser);
  }
  late int id;
  final UserBloc userBloc;
  FutureOr<void> loginUser(
      UserLoginEvent event, Emitter<LoginState> emit) async {
    emit(UserLoginIsLoadingState());
    // print(event.email);
    // print(event.password);
    final userData = {"email": event.email, "password": event.password};
    final data = await AuthRepo().userLogin(userData);

    data.fold((error) => emit(UserLoginErrorState(message: error.message)),
        (responce) {
      id = responce['id'];
      // print(id);
      Sharedprfe.instance.storage(id);
   //   userBloc.add(UserDataFetchEvent());

      emit(UserLoginSuccessState());
    });
  }
}
