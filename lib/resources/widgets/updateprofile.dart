import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/bloc/profileupdate/bloc/profileupdate_bloc.dart';
import 'package:userapp/bloc/user/user_bloc.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/resources/constant/textstyle.dart';
import 'package:userapp/resources/widgets/customtextfield.dart';
import 'package:userapp/resources/widgets/textfieldspace.dart';
import 'package:userapp/utils/customsnackbar.dart';
import 'package:userapp/utils/validations.dart';

class UpdateProfileBottomSheet extends StatefulWidget {
  const UpdateProfileBottomSheet({super.key});

  @override
  UpdateProfileBottomSheetState createState() =>
      UpdateProfileBottomSheetState();
}

class UpdateProfileBottomSheetState extends State<UpdateProfileBottomSheet> {
  final GlobalKey<FormState> updateKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController mailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: 350,
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: SingleChildScrollView(
            child: Form(
              key: updateKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  BlocConsumer<ProfileupdateBloc, ProfileupdateState>(
                    listener: (context, state) {
                      if (state is UpdateProfileSuccessState) {
                        context.read<UserBloc>().add(UserDataFetchEvent());
                        CustomSnackBar.showCustomSnackBar(
                            context, 'Successfully Updated');
                        Navigator.of(context).pop();
                      } else if (state is UpdateProfileErrorState) {
                        CustomSnackBar.showCustomSnackBar(
                            context, state.message);
                      }
                    },
                    builder: (context, state) {
                      return ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(AppColors.whiteColor),
                        ),
                        onPressed: () {
                          if (updateKey.currentState!.validate()) {
                            context.read<ProfileupdateBloc>().add(
                                  ProfileupdatingEvent(
                                    username: userNameController.text,
                                    email: mailController.text,
                                    phone: phoneController.text,
                                  ),
                                );
                          }
                        },
                        child: const Text(
                          'Update',
                          style: TextStyle(color: AppColors.blackColor),
                        ),
                      );
                    },
                  ),
                  const TextFieldSpacing(),
                  SignUpTextField(
                    validator: (p0) =>
                        Validations.isEmpty(p0, 'Username'),
                    controller: userNameController,
                    label: 'Username',
                    labelStyle: AppText.labeltext,
                  ),
                  const TextFieldSpacing(),
                  SignUpTextField(
                    validator: (p0) => Validations.isNumber(p0, 'Numbers'),
                    label: 'Phone',
                    controller: phoneController,
                    labelStyle: AppText.labeltext,
                  ),
                  const TextFieldSpacing(),
                  SignUpTextField(
                    validator: (p0) => Validations.isEmail(p0),
                    controller: mailController,
                    label: 'Mail',
                    labelStyle: AppText.labeltext,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
