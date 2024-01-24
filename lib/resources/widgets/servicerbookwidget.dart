import 'package:flutter/material.dart'; 
import 'package:userapp/models/savedmodel.dart';
import 'package:userapp/models/servicemodels.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/resources/constant/textstyle.dart';
import 'package:userapp/resources/widgets/book_mark_widget.dart';

// ignore: must_be_immutable
class JobDetailsWidget extends StatelessWidget {
  final String jobName;
  final String name;
  final String location;
  final String amount;
  final String imageUrl;
  final ServicersModel? servicers;
  final List<SavedModel>? savedModel;

  ValueNotifier<bool> savedVisibility = ValueNotifier(false);
  int index;

  JobDetailsWidget({
   required this.savedModel,
    Key? key,
    required this.servicers,
    required this.index,
    required this.jobName,
    required this.name,
    required this.location,
    required this.amount,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          constraints: const BoxConstraints(minHeight: 130),
          height: screenSize.height * 0.55,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            height: screenSize.height * 0.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        Positioned(
          top: screenSize.height * 0.37,
          left: 10,
          right: 10,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(15),
            ),
            width: double.maxFinite,
            height: 130,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, top: 20),
                      child: Column(
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
                            name,
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
                                overflow: TextOverflow.ellipsis,
                                style: AppText.smallabeltext,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15, bottom: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [          
                          // book mark widget 
                              BookMarkWidget(savedList:savedModel! ,serviceModel: servicers!,),                
                          Container(
                            width: screenSize.width * 0.1 + 40,
                            height: screenSize.height * 0.04,
                            decoration: BoxDecoration(
                              color: AppColors.accentColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: Text(
                                amount,
                                style: AppText.xSmall,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
