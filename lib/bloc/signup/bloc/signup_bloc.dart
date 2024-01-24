import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/data/sharedpreference/sharedpreference.dart';
import 'package:userapp/repositories/authentication.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<UserSignupEvent>(signUpUser);
    on<OtpValidationEvent>(validateOtp);
  }
  late int otpFromApi;
  late int id;

  FutureOr<void> signUpUser(
      UserSignupEvent event, Emitter<SignupState> emit) async {
    emit(SignupLoadingState());
    final userData = {
      "username": event.username,
      "email": event.email,
      "phone": event.phone,
      "password": event.password
    };
    // print(userData);
    final data = await AuthRepo().userSignUp(userData);

    data.fold((error) => emit(SignupErrorState(message: error.message)),
        (responce) {
      otpFromApi = int.parse(responce['otp'].toString());
      id = responce['id'];  
print(otpFromApi);  
      Sharedprfe.instance.storage(id);

      emit(SignupSuccessState());
    });
  }

  FutureOr<void> validateOtp(
      OtpValidationEvent event, Emitter<SignupState> emit) {
    if (event.otp == otpFromApi) {
      emit(OtpMatchedState());
    } else {
      emit(OtpNotMatchedState());
    }
  }

}
