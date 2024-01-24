import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/resources/constant/textstyle.dart';

class CategoriesCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String jobName;
  final String amount;
  final VoidCallback? onTap;
  final List<Widget>? dynamicWidgets;

  const CategoriesCard({super.key, 
    required this.imageUrl,
    required this.name,
    required this.jobName,
    required this.amount,
    this.onTap,
    this.dynamicWidgets,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1 + 30,
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      width: MediaQuery.of(context).size.width * 0.3,
                      fit: BoxFit.cover,
                      imageUrl: imageUrl,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey.shade500,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.1 + 20,
                          width: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(
                            color: AppColors.accentColor,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.04,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1 + 20,
                    width: MediaQuery.of(context).size.width * 0.4 - 20,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: AppText.incontainer,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          jobName,
                          style: AppText.labeltext,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          amount,
                          style: AppText.xSmall,
                        )
                      ],
                    ),
                  ),
                
                  if (dynamicWidgets != null) ...dynamicWidgets!,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
