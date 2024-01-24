import 'package:flutter/material.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/resources/constant/textstyle.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? leading;
  final Color backgroundColor;
  final double elevation;
  final String? rightText;
  final VoidCallback? onEditPressed;

  // Add a boolean flag to control the visibility of the IconButton
  final bool showIconButton;

  const CustomAppBar({
    Key? key,
    this.title,
    this.leading,
    required this.backgroundColor,
    this.elevation = 0,
    this.rightText,
    this.onEditPressed,
    this.showIconButton = false, // Set default to false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      leading: leading,
      backgroundColor: backgroundColor,
      elevation: elevation,
      actions: <Widget>[
        if (rightText != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Text(
                rightText!,
                style: AppText.appname,
              ),
            ),
          ),
        // Conditionally show the IconButton based on the flag
        if (showIconButton)
          IconButton(
            icon: const Icon(Icons.search,color: AppColors.whiteColor,),
            onPressed: onEditPressed,
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
