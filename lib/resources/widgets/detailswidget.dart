import 'package:flutter/material.dart';
import 'package:userapp/models/bookimgsmodel.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/resources/constant/textstyle.dart';
import 'package:userapp/resources/widgets/customappbar.dart';
import 'package:userapp/resources/widgets/servicerbookwidget.dart';
import 'package:userapp/resources/widgets/textfieldspace.dart';

class BookingDetails extends StatelessWidget {
  final BookingModel servicers;

  const BookingDetails({Key? key, required this.servicers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: const CustomAppBar(
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Stack(
              children: [
                JobDetailsWidget(
                  jobName: servicers.serviceCategory,
                  amount: '₹${servicers.serviceAmount.toString()}',
                  location: servicers.location,
                  name: servicers.username ,
                  imageUrl: servicers.servicerImage,
                ),
              ],
            ),
            Text(
              'About me',
              style: AppText.labeltext,
            ),
            Card(
              color: AppColors.primaryColor,
              child: Text(
                servicers.description,
                style: AppText.smallabeltext,
              ),
            ),
            const TextFieldSpacing(),
            // CustomElevatedButton(
            //   onPressed: () {
            //     Navigator.of(context).push(MaterialPageRoute(
            //       builder: (context) => AdressTaking(servicers: servicers),
            //     ));
            //   },
            //   buttonText: 'Book Now',
            // ),
          ],
        ),
      ),
    );
  }
}
