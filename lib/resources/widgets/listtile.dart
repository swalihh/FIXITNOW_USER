import 'package:flutter/material.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/resources/constant/textstyle.dart';

class ListTileWidget extends StatelessWidget {
  final bool isVisible;
  final VoidCallback? onTap;
  final IconData icon;
  final String title;

  const ListTileWidget({super.key, 
    required this.isVisible,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            icon,
            color: isVisible ? Colors.white : Colors.transparent,
          ),
          title: Text(
            title,
            style:AppText.smallabeltext
          ),
          onTap: onTap,
        ),
        Container(
          color: isVisible ? AppColors.primaryColor : Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.001,
        ),
      ],
    );
  }
}
