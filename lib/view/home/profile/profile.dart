import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/bloc/profileupdate/bloc/profileupdate_bloc.dart';
import 'package:userapp/bloc/user/user_bloc.dart';
import 'package:userapp/data/sharedpreference/sharedpreference.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/resources/constant/textstyle.dart';
import 'package:userapp/resources/strings/hometext.dart';
import 'package:userapp/resources/widgets/customappbar.dart';
import 'package:userapp/resources/widgets/customtextfield.dart';
import 'package:userapp/resources/widgets/listtile.dart';
import 'package:userapp/resources/widgets/textfieldspace.dart';
import 'package:userapp/utils/customalertbox.dart';
import 'package:userapp/utils/customsnackbar.dart';
import 'package:userapp/utils/validations.dart';
import 'package:userapp/view/home/profile/appinfo.dart';
import 'package:userapp/view/home/profile/help.dart';
import 'package:userapp/view/home/profile/terms_confitions.dart';
import 'package:userapp/view/signup/opening.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController mailController = TextEditingController();
    final updateKey = GlobalKey<FormState>();

    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: CustomAppBar(
        title: Text('Profile', style: AppText.labeltext),
        //  leading: const Icon(Icons.fiber_manual_record),
        rightText: HomeString.appName,
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: [
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserDataLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is UserDataFetchSuccessState) {
                  // final user = state.user;
                  userNameController.text = state.user.username;
                  phoneController.text = state.user.phone;
                  mailController.text = state.user.email;
                  return Container(
                    height: screenSize.height * 0.17,
                    decoration: BoxDecoration(
                        color: AppColors.backgroundColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Container(
                              decoration: const BoxDecoration(
                                // color: AppColors.accentColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'personal Details',
                                      style: AppText.labeltext,
                                    ),
                                    const TextFieldSpacing(),
                                    Text(
                                      state.user.username,
                                      style: AppText.labeltext,
                                    ),
                                    Text(
                                      state.user.phone,
                                      style: AppText.smallabeltext,
                                    ),
                                    const TextFieldSpacing(),
                                    Text(
                                      state.user.email,
                                      style: AppText.labeltext,
                                    ),
                                  ],
                                ),
                              ),
                            )),
                        Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.topRight,
                              decoration: const BoxDecoration(
                                // color: AppColors.accentColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                ),
                              ),
                              child: IconButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) => Padding(
                                              padding: EdgeInsets.only(
                                                  bottom:
                                                      MediaQuery.viewInsetsOf(
                                                              context)
                                                          .bottom),
                                              child: Container(
                                                height: 350,
                                                decoration: const BoxDecoration(
                                                  color: AppColors.primaryColor,
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(22),
                                                  child: SingleChildScrollView(
                                                    child: Form(
                                                      key: updateKey,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          BlocConsumer<
                                                              ProfileupdateBloc,
                                                              ProfileupdateState>(
                                                            listener: (context,
                                                                state) {
                                                              if (state
                                                                  is UpdateProfileSuccessState) {
                                                                context
                                                                    .read<
                                                                        UserBloc>()
                                                                    .add(
                                                                        UserDataFetchEvent());
                                                                CustomSnackBar
                                                                    .showCustomSnackBar(
                                                                        context,
                                                                        'Successfully Updated');
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              } else if (state
                                                                  is UpdateProfileErrorState) {
                                                                CustomSnackBar
                                                                    .showCustomSnackBar(
                                                                        context,
                                                                        state
                                                                            .message);
                                                              }
                                                            },
                                                            builder: (context,
                                                                state) {
                                                              return ElevatedButton(
                                                                  style: const ButtonStyle(
                                                                      backgroundColor:
                                                                          MaterialStatePropertyAll(AppColors
                                                                              .whiteColor)),
                                                                  onPressed:
                                                                      () {
                                                                    if (updateKey
                                                                        .currentState!
                                                                        .validate()) {
                                                                      context.read<ProfileupdateBloc>().add(ProfileupdatingEvent(
                                                                          username: userNameController
                                                                              .text,
                                                                          email: mailController
                                                                              .text,
                                                                          phone:
                                                                              phoneController.text));
                                                                    }
                                                                  },
                                                                  child:
                                                                      const Text(
                                                                    'Update',
                                                                    style: TextStyle(
                                                                        color: AppColors
                                                                            .blackColor),
                                                                  ));
                                                            },
                                                          ),
                                                          const TextFieldSpacing(),
                                                          SignUpTextField(
                                                            validator: (p0) =>
                                                                Validations.isEmpty(
                                                                    p0,
                                                                    'Username'),
                                                            controller:
                                                                userNameController,
                                                            label: 'Username',
                                                            labelStyle: AppText
                                                                .labeltext,
                                                          ),
                                                          const TextFieldSpacing(),
                                                          SignUpTextField(
                                                            validator: (p0) =>
                                                                Validations
                                                                    .isNumber(
                                                                        p0,
                                                                        'Numbers'),
                                                            label: 'Phone',
                                                            controller:
                                                                phoneController,
                                                            labelStyle: AppText
                                                                .labeltext,
                                                          ),
                                                          const TextFieldSpacing(),
                                                          SignUpTextField(
                                                            validator: (p0) =>
                                                                Validations
                                                                    .isEmail(
                                                                        p0),
                                                            controller:
                                                                mailController,
                                                            label: 'Mail',
                                                            labelStyle: AppText
                                                                .labeltext,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ));
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: AppColors.whiteColor,
                                  )),
                            ))
                      ],
                    ),
                  );
                }
                return Container();
              },
            ),
            const TextFieldSpacing(),
            Container(
              height: screenSize.height * 0.45,
              decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                children: [
                  ListTileWidget(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const TermsAndConditions(),
                    )),
                    icon: Icons.gavel_sharp,
                    isVisible: true,
                    title: 'Privacy Policy',
                  ),
                  ListTileWidget(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Help(),
                    )),
                    icon: Icons.help_center_outlined,
                    isVisible: true,
                    title: 'App Help',
                  ),
                  ListTileWidget(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AppInfo(),
                    )),
                    icon: Icons.info_outline,
                    isVisible: true,
                    title: 'App Info',
                  ),
                  
                  ListTileWidget(
                    icon: Icons.logout_rounded,
                    isVisible: true,
                    title: 'Log out',
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => CustomAlertDialogWidget(
                          text1: 'Log out',
                          text2: 'Do you want to Log out ?',
                          text3: 'Cancel',
                          text4: 'Confirm',
                          onPressFunction: () {
                            Sharedprfe.instance.removerId();
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => const Opening(),
                            ));
                          },
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: screenSize.height * 0.08,
                  ),
                  Center(
                      child: Text(
                    HomeString.versionName,
                    style: AppText.versionName,
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
