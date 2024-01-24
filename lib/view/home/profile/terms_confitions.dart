import 'package:flutter/material.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/resources/constant/textstyle.dart';
import 'package:userapp/resources/strings/privacy.dart';
import 'package:userapp/resources/widgets/customappbar.dart';
import 'package:userapp/resources/widgets/textfieldspace.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: const CustomAppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text('Privacy Policy'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const TextFieldSpacing(),
            info(PrivasyText.informationCollectionLabel,
                PrivasyText.informationCollectionText),
            info(PrivasyText.locationInformationLabel,
                PrivasyText.locationInformationText),
            info(PrivasyText.paymentInformationLabel,
                PrivasyText.paymentInformationText),
            info(PrivasyText.dataSharingLabel, PrivasyText.dataSharingText1),
            info(PrivasyText.securityLabel, PrivasyText.securityText),
            info(PrivasyText.childrenPrivacyLabel,
                PrivasyText.childrenPrivacyText),
            info(PrivasyText.changesLabel, PrivasyText.changesText),
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
