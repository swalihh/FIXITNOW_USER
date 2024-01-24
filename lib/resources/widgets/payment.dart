import 'package:flutter/material.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/resources/constant/textstyle.dart';
import 'package:userapp/resources/widgets/textfieldspace.dart';

class PaymentDetailsWidget extends StatelessWidget {
  final String startingTime;
  final String endingTime;
  final String amount;
  final String? duration; // Make duration optional

  const PaymentDetailsWidget({
    super.key,
    required this.startingTime,
    required this.endingTime,
    required this.amount,
    this.duration, // Make duration optional
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      width: double.infinity,
      height: 250,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Payment',
                  style: AppText.smallBlack,
                ),
              ],
            ),
            const TextFieldSpacingAverage(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Starting Time:',
                  style: AppText.smallBlack,
                ),
                Text(
                  startingTime,
                  style: AppText.smallBlack,
                ),
              ],
            ),
            const TextFieldSpacing(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ending Time:',
                  style: AppText.smallBlack,
                ),
                Text(
                  endingTime,
                  style: AppText.smallBlack,
                ),
              ],
            ),
            const TextFieldSpacing(),
            Container(
              color: AppColors.primaryColor,
              height: 2,
            ),
            const TextFieldSpacing(),
            if (duration != null) // Display duration only if it's provided
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Duration:',
                    style: AppText.smallBlack,
                  ),
                  Text(
                    duration!,
                    style: AppText.smallBlack,
                  ),
                ],
              ),
            const TextFieldSpacing(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Amount:',
                  style: AppText.smallBlack,
                ),
                Text(
                  amount,
                  style: AppText.smallBlack,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
