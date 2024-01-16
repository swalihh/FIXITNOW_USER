import 'package:flutter/material.dart';
import 'package:userapp/resources/constant/textstyle.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? leading;
  final Color backgroundColor;
  final double elevation;
  final String? rightText;
  final List<PopupMenuEntry<String>> popupMenuEntries;
  final VoidCallback? onEditPressed;

  // Add a boolean flag to control the visibility of the PopupMenuButton
  final bool showPopupMenuButton;

  const CustomAppBar({
    Key? key,
    this.title,
    this.leading,
    required this.backgroundColor,
    this.elevation = 0,
    this.rightText,
    this.popupMenuEntries = const [],
    this.onEditPressed,
    this.showPopupMenuButton = false, // Set default to false
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
        // Conditionally show the PopupMenuButton based on the flag
        if (showPopupMenuButton)
          PopupMenuButton<String>(
            clipBehavior: Clip.hardEdge,
            onSelected: (value) {
              if (value == 'Search' && onEditPressed != null) {
                onEditPressed!();
              }
            },
            itemBuilder: (context) => popupMenuEntries,
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
