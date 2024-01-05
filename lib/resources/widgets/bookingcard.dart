import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/resources/constant/textstyle.dart';

class BookingCardWidget extends StatelessWidget {
  final String name;
  final String jobTitle;
  final String price;
 final  String? status;
  final String location;
  final String imageUrl; 
  const BookingCardWidget({
    Key? key,
    required this.name,
    required this.jobTitle,
    required this.price,
     this.status,
    required this.location,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(5),
      ),
      height: 110,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: imageUrl,
                    placeholder:(context, url) =>  Shimmer.fromColors(
                      baseColor: Colors.grey.shade500,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                       
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        image: DecorationImage(image: NetworkImage(imageUrl),fit: BoxFit.cover)
                      ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 15),
                child: Column(
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
                      jobTitle,
                      style: AppText.labeltext,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text(
                      price,
                      style: AppText.xSmall,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    status!=null?
                    Container(

                      alignment: Alignment.center,
                      height: 20,
                      width: 70,
                      decoration: BoxDecoration(
                        color:status=='Pending'? Colors.orange:status=='Completed'?Colors.green:Colors.red,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Text(
                        status??'',
                        style: AppText.xSmall,
                      ),
                    )
                    :SizedBox(),
                    Text(
                      location,
                      style: AppText.xSmall,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//   