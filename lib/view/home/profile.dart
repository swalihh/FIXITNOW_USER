import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/bloc/user/user_bloc.dart';
import 'package:userapp/data/sharedpreference/sharedpreference.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/resources/constant/textstyle.dart';
import 'package:userapp/resources/strings/hometext.dart';
import 'package:userapp/resources/widgets/customappbar.dart';
import 'package:userapp/resources/widgets/textfieldspace.dart';
import 'package:userapp/utils/customalertbox.dart';
import 'package:userapp/view/signup/opening.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    context.read<UserBloc>().add(UserDataFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: CustomAppBar(
        leading: const Icon(Icons.fiber_manual_record),
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
                                  onPressed: () {},
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
              height: screenSize.height * 0.55,
              decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                children: [
                  ListTile(
                    leading: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => CustomAlertDialogWidget(
                              text1: 'Log out',
                              text2: 'Do you want to Log out ?',
                              text3: 'Cancel',
                              text4: 'Confirm',
                              onPressFunction: () {Sharedprfe.instance.removerId();
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => const Opening(),
                          ));},
                            ),
                          );

                          
                        },
                        icon: const Icon(
                          Icons.logout,
                          color: AppColors.whiteColor,
                        )),
                    title: Text(
                      'Log out',
                      style: AppText.smallabeltext,
                    ),
                  ),
                  Container(
                    color: AppColors.primaryColor,
                    width: screenSize.width,
                    height: screenSize.height * 0.001,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
