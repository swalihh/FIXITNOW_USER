import 'package:flutter/material.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/resources/constant/textstyle.dart';

class CustomSnackBar {
  static void showCustomSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      _buildCustomSnackBar(message),
    );
  }

  static SnackBar _buildCustomSnackBar(String message) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      padding: EdgeInsets.only(bottom: 5),
      backgroundColor: AppColors.whiteColor,
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 25,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(message, style: AppText.smallBlack),
          ),
        ),
      ),
    );
  }
}
