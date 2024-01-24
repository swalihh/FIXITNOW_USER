import 'package:flutter/material.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/resources/constant/textstyle.dart';
import 'package:userapp/resources/strings/appinfo.dart';
import 'package:userapp/resources/widgets/customappbar.dart';
import 'package:userapp/resources/widgets/textfieldspace.dart';

class AppInfo extends StatelessWidget {
  const AppInfo({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: const CustomAppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text('App Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const TextFieldSpacing(),
            info(AppInfoString.aboutLabel, AppInfoString.aboutText),
            Row(
              children: [
                const Icon(Icons.handyman_outlined,
                    color: AppColors.whiteColor, size: 18),
                const SizedBox(
                  width: 8,
                ),
                Text(AppInfoString.whylabel, style: AppText.labeltext),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            // Wrap Text widget with Flexible
            Row(
              children: [
                const Icon(Icons.circle, color: AppColors.whiteColor, size: 15),
                const SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: Text(
                    AppInfoString.whytext0,
                    style: AppText.privacyText,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const Icon(Icons.circle, color: AppColors.whiteColor, size: 15),
                const SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: Text(
                    AppInfoString.whytext2,
                    style: AppText.privacyText,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const Icon(Icons.circle, color: AppColors.whiteColor, size: 15),
                const SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: Text(
                    AppInfoString.whytext1,
                    style: AppText.privacyText,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const Icon(Icons.circle, color: AppColors.whiteColor, size: 15),
                const SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: Text(
                    AppInfoString.whytext3,
                    style: AppText.privacyText,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const Icon(Icons.circle, color: AppColors.whiteColor, size: 15),
                const SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: Text(
                    AppInfoString.whytext4,
                    style: AppText.privacyText,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const Icon(Icons.circle, color: AppColors.whiteColor, size: 15),
                const SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: Text(
                    AppInfoString.whytext5,
                    style: AppText.privacyText,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: [
                const Icon(Icons.circle, color: AppColors.whiteColor, size: 15),
                const SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: Text(
                    AppInfoString.whytext6,
                    style: AppText.privacyText,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
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
