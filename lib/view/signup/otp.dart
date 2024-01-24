import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:userapp/bloc/Cleaning/bloc/cleaning_bloc.dart';
import 'package:userapp/bloc/Cooking/bloc/cooking_bloc.dart';
import 'package:userapp/bloc/Electrition/bloc/electrition_bloc.dart';
import 'package:userapp/bloc/bookinglist/bloc/bookinglist_bloc.dart';
import 'package:userapp/bloc/others/others_bloc.dart';
import 'package:userapp/bloc/painting/painting_bloc.dart';
import 'package:userapp/bloc/plumbing/plumbing_bloc.dart';
import 'package:userapp/bloc/saved/bloc/saved_bloc.dart';
import 'package:userapp/bloc/servicers/bloc/servicers_bloc.dart';
import 'package:userapp/bloc/signup/bloc/signup_bloc.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/resources/constant/textstyle.dart';
import 'package:userapp/resources/strings/opening.dart';
import 'package:userapp/resources/widgets/customappbar.dart';
import 'package:userapp/resources/widgets/customelevatedbutton.dart';
import 'package:userapp/resources/widgets/textfieldspace.dart';
import 'package:userapp/view/home/bottomnavigaton.dart';

class Otp extends StatelessWidget {
  Otp({super.key});
  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back)),
          backgroundColor: AppColors.primaryColor,
        ),
        backgroundColor: AppColors.primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(22.0),
          child: SizedBox(
            height: screenSize.height,
            width: screenSize.width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const TextFieldSpacingAverage(),
                  Text(
                    LoginString.otptext,
                    style: AppText.labeltextbig,
                  ),
                  Text(
                    LoginString.otpsub,
                    style: AppText.xSmall,
                  ),
                  SizedBox(
                    height: screenSize.height * 0.3,
                  ),
                  OtpTextField(
                    borderWidth: 0,
                    textStyle: AppText.mediumWhite,
                    cursorColor: AppColors.primaryColor,
                    filled: true,
                    fillColor: AppColors.backgroundColor,
                    onSubmit: (value) {
                      otpController.text = value;
                      context.read<SignupBloc>().add(OtpValidationEvent(
                          otp: int.parse(otpController.text)));
                    },
                    showFieldAsBox: true,
                  ),
                  SizedBox(
                    height: screenSize.height * 0.3,
                  ),
                  BlocListener<SignupBloc, SignupState>(
                    listener: (context, state) {
                      if (state is OtpMatchedState) {
                        context
                            .read<ServicersBloc>()
                            .add(FetchAllServicersEvent());
                        context.read<CleaningBloc>().add(GetAllCleaningEvent());
                        context
                            .read<ElectritionBloc>()
                            .add(GetAllElectritonsEvent());
                        context
                            .read<CookingBloc>()
                            .add(FetchAllCookingDataEvent());
                        context
                            .read<OthersBloc>()
                            .add(GetOtherServicersEvent());
                        context.read<PaintingBloc>().add(GetAllPainterEvent());
                        context
                            .read<PlumbingBloc>()
                            .add(PlumberDetailsFetchEvent());
                        context
                            .read<BookinglistBloc>()
                            .add(GetAllBookingDetailsEvent());
                        context.read<SavedBloc>().add(GetSavedEvent());

                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const Start(),
                            ),
                            (route) => false);
                      } else if (state is OtpNotMatchedState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('not matched')));
                      }
                    },
                    child: CustomElevatedButton(
                      onPressed: () {
                        if (otpController.text.length < 4) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor:
                                      Color.fromARGB(255, 255, 64, 64),
                                  content: Text('invalid')));
                        }
                      },
                      buttonText: 'Continue',
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
