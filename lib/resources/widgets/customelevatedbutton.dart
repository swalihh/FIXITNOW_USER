import 'package:flutter/material.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/resources/constant/textstyle.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    this.buttonText = 'Button',
  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.whiteColor,
            fixedSize: Size(screenSize.width, screenSize.height / 16)),
        child: Text(
          buttonText,
          style: AppText.button,
        ));
  }
}
