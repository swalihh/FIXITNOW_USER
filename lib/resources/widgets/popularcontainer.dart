import 'package:flutter/material.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/resources/constant/textstyle.dart';

class CustomCardWidget extends StatelessWidget {
  final String backgroundImageUrl;
  final String profileImageUrl;
  final String jobName;
  final String amount;
  final String name;

  const CustomCardWidget({
    Key? key,
    required this.backgroundImageUrl,
    required this.profileImageUrl,
    required this.jobName,
    required this.amount,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(backgroundImageUrl),
              fit: BoxFit.cover,
            ),
            color: Colors.lightGreen,
            borderRadius: BorderRadius.circular(15),
          ),
          height: screenSize.height * 0.2,
          width: screenSize.width * 0.4 + 10,
        ),
        Positioned(
          bottom: screenSize.height * 0.01 - 9,
          child: Container(
            height: screenSize.height * 0.1 - 10,
            width: screenSize.width * 0.4 + 10,
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: screenSize.width * 0.3 - 30,
                        child: Text(
                          jobName,
                          style: AppText.labeltext,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        width: screenSize.width * 0.1 + 20,
                        height: screenSize.height * 0.03,
                        decoration: BoxDecoration(
                          color: AppColors.accentColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            amount,
                            style:AppText.xSmall
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenSize.height * 0.01),
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.amberAccent,
                          image: DecorationImage(
                            image: NetworkImage(profileImageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: screenSize.width * 0.02),
                      SizedBox(
                        width: screenSize.width * 0.3,
                        child: Text(
                          name, // Use the provided name variable
                          style: AppText.xSmall,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
