import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:userapp/bloc/payment/payment_bloc.dart';
import 'package:userapp/bloc/razorpay/razorpay_bloc.dart';
import 'package:userapp/models/servicemodels.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/resources/constant/textstyle.dart';
import 'package:userapp/resources/strings/hometext.dart';
import 'package:userapp/resources/widgets/customappbar.dart';
import 'package:userapp/resources/widgets/customelevatedbutton.dart';
import 'package:userapp/resources/widgets/payment.dart';
import 'package:userapp/resources/widgets/servicerbookwidget.dart';
import 'package:userapp/resources/widgets/textfieldspace.dart';
import 'package:userapp/utils/Customsnackbar.dart';

// ignore: must_be_immutable
class BookingDetails extends StatefulWidget {
  final ServicersModel servicers;
  int index;

  BookingDetails({Key? key, required this.servicers, required this.index})
      : super(key: key);
  
  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: const CustomAppBar(
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Stack(
              children: [
                JobDetailsWidget(
                  servicers: widget.servicers,
                  savedModel: const [],
                  index: widget.index,
                  jobName: widget.servicers.serviceCategory,
                  amount: '₹${widget.servicers.serviceAmount.toString()}',
                  location: widget.servicers.location,
                  name: widget.servicers.username,
                  imageUrl: widget.servicers.servicerImage,
                ),
              ],
            ),
            Text(
              'About me',
              style: AppText.labeltext,
            ),
            Card(
              color: AppColors.primaryColor,
              child: Text(
                widget.servicers.description,
                style: AppText.smallabeltext,
              ),
            ),
            const TextFieldSpacing(),
            CustomElevatedButton(
              onPressed: () {
                context.read<PaymentBloc>().add(FetchPaymentDetailsEvent(
                    context,
                    bookingid: widget.servicers.id.toString()));

                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    double keyboardHeight =
                        MediaQuery.of(context).viewInsets.bottom;
                    double bottomSheetHeight =
                        MediaQuery.of(context).size.height - keyboardHeight;
                    return BlocConsumer<PaymentBloc, PaymentState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state is FetchPaymentDetailsSuccessState) {
                          if (state.startingTime !=
                                  "0001-01-01T00:00:00Z" &&
                              state.endingTime == '0001-01-01T00:00:00Z') {
                            return SizedBox(
                              height: bottomSheetHeight * 0.6,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                                child: Container(
                                  color: AppColors.whiteColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Work in progress! \nOur professional is currently providing the service',
                                          style: AppText.smallBlack,
                                          textAlign: TextAlign.center,
                                        ),
                                        const TextFieldSpacingAverage(),
                                        const TextFieldSpacing(),
                                        SizedBox(
                                          height: 250,
                                          width: 250,
                                          child: Lottie.asset(
                                              "asset/images/lottie1.json"),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else if (state.endingTime !=
                              '0001-01-01T00:00:00Z') {
                            int money = state.revenue;
                            return SizedBox(
                              height: bottomSheetHeight * 0.6,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  color: AppColors.backgroundColor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          HomeString.appName,
                                          style: AppText.appname,
                                        ),
                                        PaymentDetailsWidget(
                                          startingTime: getFormatedString(
                                              state.startingTime, context),
                                          endingTime: getFormatedString(
                                              state.endingTime, context),
                                          amount: state.revenue.toString(),
                                        ),
                                        BlocConsumer<RazorpayBloc,
                                            RazorpayState>(
                                          listener: (context, state) {
                                            if (state
                                                is RazorpaySuccessState) {
                                              Navigator.of(context).pop();
                                              return CustomSnackBar
                                                  .showCustomSnackBar(context,
                                                      'Payment Success');
                                            } else if (state
                                                is RazorpayFailedState) {
                                              return CustomSnackBar
                                                  .showCustomSnackBar(context,
                                                      'Payment failed  ');
                                            }
                                          },
                                          builder: (context, state) {
                                            return state
                                                    is RazorpaySuccessState 
                                                ? SizedBox(
                                                    height: 50,
                                                    child: Center(
                                                      child: Text(
                                                        'Completed',
                                                        style: AppText.averagewhite,
                                                      ),
                                                    ),
                                                  )
                                                : InkWell(
                                                    onTap: () {
                                                      context
                                                          .read<RazorpayBloc>()
                                                          .add(RazorpayStartEvent(
                                                              amount: money));
                                                    },
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 50,
                                                      color:
                                                          AppColors.primaryColor,
                                                      child: Center(
                                                          child: Text(
                                                        'Pay now',
                                                        style:
                                                            AppText.averagewhite,
                                                      )),
                                                    ),
                                                  );
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return SizedBox(
                              height: bottomSheetHeight * 0.6,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                                child: Container(
                                  color: AppColors.whiteColor,
                                  child: Center(
                                      child: Text(
                                    'Please wait, your service will begin shortly.',
                                    style: AppText.smallBlack,
                                  )),
                                ),
                              ),
                            );
                          }
                        }
                        if (state is FetchPaymentDetailsLoadingState) {
                          return SizedBox(
                              height: bottomSheetHeight * 0.6,
                              child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                  child: Container(
                                    color: AppColors.whiteColor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Please Wait... ',
                                            style: AppText.smallBlack,
                                          ),
                                          const TextFieldSpacingAverage(),
                                          const TextFieldSpacing(),
                                          Transform.scale(
                                            scale: 0.5,
                                            child: const CircularProgressIndicator(
                                                backgroundColor: Colors.blue),
                                          )
                                        ],
                                      ),
                                    ),
                                  )));
                        }
                        return const SizedBox();
                      },
                    );
                  },
                );
              },
              buttonText: 'Check Payment Status',
            ),
          ],
        ),
      ),
    );
  }

  String getFormatedString(dynamic date, BuildContext context) {
    DateTime dateTime = DateTime.parse(date);

    return TimeOfDay.fromDateTime(dateTime).format(context).toString();
  }
}
