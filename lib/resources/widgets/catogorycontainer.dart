import 'package:flutter/material.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/resources/constant/textstyle.dart';

class Categories extends StatelessWidget {
  final String labelText;
  final String imagePath;
  final VoidCallback? onTap;

  const Categories({super.key, 
    required this.labelText,
    required this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: screenSize.height * 0.1 + 3,
          width: screenSize.width * 0.3 - 25,
          decoration: BoxDecoration(
            color:AppColors.backgroundColor,
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 0, 0, 0),
                blurRadius: 5.0,
                offset: Offset(0, 2),
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.contain,
                    ),
                  ),
                  height: screenSize.height * 0.06,
                  width: screenSize.width * 0.2 - 18,
                ),
                const SizedBox(height: 4,),
                Text(labelText, style: AppText.smalldestext),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


