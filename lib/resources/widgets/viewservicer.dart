import 'package:flutter/material.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/resources/constant/textstyle.dart';

class ServiceDetailsCard extends StatelessWidget {
  final String backgroundImageUrl;
  final String jobName;
  final String workerName;
  final String location;
  final String amount;
  final String description;

  const ServiceDetailsCard({
    required this.backgroundImageUrl,
    required this.jobName,
    required this.workerName,
    required this.location,
    required this.amount,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(backgroundImageUrl),
          fit: BoxFit.cover,
        ),
      ),
      height: screenSize.height * 0.4,
      child: Positioned(
        top: screenSize.height * 0.3 + 40,
        left: 10,
        right: 10,
        bottom: screenSize.height * 0.3 + 40,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.backgroundColor.withOpacity(0.8),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: screenSize.height * 0.1,
                  width: screenSize.width * 0.6 - 25,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        jobName,
                        style: AppText.labeltext,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(
                        workerName,
                        style: AppText.smallabeltext,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            color: AppColors.whiteColor,
                          ),
                          Text(
                            location,
                            style: AppText.smallabeltext,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: screenSize.height * .2,
                  width: screenSize.width * 0.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: screenSize.width * 0.1 + 40,
                        height: screenSize.height * 0.04,
                        decoration: BoxDecoration(
                          color: AppColors.accentColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(amount, style: AppText.xSmall),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
