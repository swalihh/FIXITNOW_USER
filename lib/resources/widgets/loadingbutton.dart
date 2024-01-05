import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/resources/constant/textstyle.dart';

class Loadingbutton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final bool showloader;

  const Loadingbutton(
      {super.key,
      required this.onPressed,
      this.buttonText = 'Button',
      required this.showloader});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.whiteColor,
            fixedSize: Size(screenSize.width, screenSize.height / 16)),
        child: showloader
            ? LoadingAnimationWidget.discreteCircle(
              secondRingColor: AppColors.backgroundColor,
              thirdRingColor: AppColors.accentColor,
                color:AppColors.primaryColor, size: 35)
            : Text(
                buttonText,
                style:AppText.button,
              ));
  }
}
