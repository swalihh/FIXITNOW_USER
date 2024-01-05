import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/bloc/bookinglist/bloc/bookinglist_bloc.dart';
import 'package:userapp/bloc/login/login_bloc.dart';
import 'package:userapp/bloc/plumbing/plumbing_bloc.dart';
import 'package:userapp/bloc/saved/bloc/saved_bloc.dart';
import 'package:userapp/bloc/signup/bloc/signup_bloc.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/resources/constant/textstyle.dart';
import 'package:userapp/resources/strings/opening.dart';
import 'package:userapp/resources/widgets/circularabtab.dart';
import 'package:userapp/resources/widgets/customtextfield.dart';
import 'package:userapp/resources/widgets/loadingbutton.dart';
import 'package:userapp/resources/widgets/loginimage.dart';
import 'package:userapp/resources/widgets/textfieldspace.dart';
import 'package:userapp/utils/validations.dart';
import 'package:userapp/view/home/bottomnavigaton.dart';
import 'package:userapp/view/signup/otp.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController loginPasswordcontroller = TextEditingController();
  TextEditingController loginMailcontroller = TextEditingController();
  final signUpKey = GlobalKey<FormState>();
  final loginKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                const TextFieldSpacingAverage(),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: TabBar(
                      indicator: BoxDecoration(
                        color: AppColors.accentColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      tabs: const [
                        CircularTab(text: 'Login'),
                        CircularTab(text: 'Signup'),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Container(
                        //   color: Colors.amber,
                        child: SingleChildScrollView(
                          child: Form(
                            key: loginKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const TextFieldSpacingAverage(),
                                Text(
                                  LoginString.login,
                                  style: AppText.mediumWhite,
                                ),
                                const LoginImage(),
                                const TextFieldSpacingAverage(),
                                SignUpTextField(
                                  controller: loginMailcontroller,
                                  validator: (p0) => Validations.isEmail(p0),
                                  label: 'Mail',
                                  labelStyle: AppText.labeltext,
                                  prefixIcon: const Icon(
                                    Icons.account_circle_outlined,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                const TextFieldSpacing(),
                                SignUpTextField(
                                  controller: loginPasswordcontroller,
                                  validator: (p0) => Validations.isPassword(p0),
                                  label: 'Password',
                                  obscureText: true,
                                  labelStyle: AppText.labeltext,
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                                const TextFieldSpacingBig(),
                                BlocConsumer<LoginBloc, LoginState>(
                                  listener: (context, state) {
                                    if (state is UserLoginErrorState) {
                                      print(state.message);
                                    } else if (state is UserLoginSuccessState) {
                                      context
                                          .read<PlumbingBloc>()
                                          .add(PlumberDetailsFetchEvent());
                                      context
                                          .read<BookinglistBloc>()
                                          .add(GetAllBookingDetailsEvent());
                                      context
                                          .read<SavedBloc>()
                                          .add(GetSavedEvent());

                                      Navigator.of(context)
                                          .pushReplacement(MaterialPageRoute(
                                        builder: (context) => const Start(),
                                      ));
                                    }
                                  },
                                  builder: (context, state) {
                                    bool isLoading =
                                        state is UserLoginIsLoadingState;
                                    return Loadingbutton(
                                      showloader: isLoading,
                                      onPressed: () {
                                        if (loginKey.currentState!.validate()) {
                                          print(
                                              " password --------${passwordController.text}email -------------${mailController.text}");
                                          context.read<LoginBloc>().add(
                                              UserLoginEvent(
                                                  password:
                                                      loginPasswordcontroller
                                                          .text,
                                                  email: loginMailcontroller
                                                      .text));
                                        }
                                      },
                                      buttonText: 'Login',
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      //-----------------------------------------------signup--------------------------------------------
                      SingleChildScrollView(
                        child: Form(
                          key: signUpKey,
                          child: Column(
                            children: [
                              const TextFieldSpacingAverage(),
                              SignUpTextField(
                                validator: (p0) =>
                                    Validations.isEmpty(p0, 'username'),
                                controller: nameController,
                                label: 'Usename',
                                labelStyle: AppText.labeltext,
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              const TextFieldSpacing(),
                              SignUpTextField(
                                validator: (p0) => Validations.isEmail(p0),
                                controller: mailController,
                                label: 'Mail',
                                labelStyle: AppText.labeltext,
                                prefixIcon: const Icon(
                                  Icons.mail,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              const TextFieldSpacing(),
                              SignUpTextField(
                                keyboardType: TextInputType.phone,
                                controller: phoneController,
                                label: 'Phone',
                                labelStyle: AppText.labeltext,
                                validator: (p0) =>
                                    Validations.isNumber(p0, 'Phone'),
                                prefixIcon: const Icon(
                                  Icons.phone,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              const TextFieldSpacing(),
                              SignUpTextField(
                                validator: (p0) => Validations.isPassword(p0),
                                obscureText: true,
                                controller: passwordController,
                                label: ' Password',
                                labelStyle: AppText.labeltext,
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              const TextFieldSpacing(),
                              SignUpTextField(
                                obscureText: true,
                                validator: (p0) => Validations.isPasswordMatch(
                                    p0, passwordController.text),
                                label: 'Confirm Password',
                                labelStyle: AppText.labeltext,
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              const TextFieldSpacingBig(),
                              BlocConsumer<SignupBloc, SignupState>(
                                listener: (context, state) {
                                  if (state is SignupSuccessState) {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => Otp(),
                                    ));
                                  } else if (state is SignupErrorState) {
                                    print(state.message);
                                  }
                                },
                                builder: (context, state) {
                                  bool isLoading = state is SignupLoadingState;
                                  return Loadingbutton(
                                    showloader: isLoading,
                                    onPressed: () {
                                      if (signUpKey.currentState!.validate()) {
                                        context.read<SignupBloc>().add(
                                            UserSignupEvent(
                                                username: nameController.text,
                                                password:
                                                    passwordController.text,
                                                email: mailController.text,
                                                phone: phoneController.text));
                                      }
                                    },
                                    buttonText: 'SignUp',
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
