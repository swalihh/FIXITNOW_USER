import 'package:flutter/material.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/resources/constant/textstyle.dart';
import 'package:userapp/resources/strings/helpstring.dart';
import 'package:userapp/resources/widgets/customappbar.dart';
import 'package:userapp/resources/widgets/textfieldspace.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: const CustomAppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text('App Help'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const TextFieldSpacing(),
            info(HelpText.serchLabel, HelpText.serchText),
            info(HelpText.categorieslabel, HelpText.categoriesText),
            info(HelpText.saveLabel, HelpText.saveText),
            info(HelpText.bookingStatuslabel, HelpText.bookingStatusText),
            info(HelpText.bookingslistLabel, HelpText.bookingslisttext),
            info(HelpText.paymentLabel, HelpText.paymenttext),
          ],
        ),
      ),
    );
  }

  Column info(String title, String description) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          const Icon(Icons.handyman_outlined,
              color: AppColors.whiteColor, size: 18),
          const SizedBox(
            width: 8,
          ),
          Text(title, style: AppText.labeltext),
        ],
      ),
      const SizedBox(height: 6),
      Text(
        description,
        style: AppText.privacyText,
        textAlign: TextAlign.justify,
      ),
      const TextFieldSpacingAverage()
    ]);
  }
}
