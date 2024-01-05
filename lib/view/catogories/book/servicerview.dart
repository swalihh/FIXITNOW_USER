import 'package:flutter/material.dart';
import 'package:userapp/models/servicemodels.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/resources/constant/textstyle.dart';
import 'package:userapp/resources/widgets/customappbar.dart';
import 'package:userapp/resources/widgets/customelevatedbutton.dart';
import 'package:userapp/resources/widgets/servicerbookwidget.dart';
import 'package:userapp/resources/widgets/textfieldspace.dart';
import 'package:userapp/view/catogories/book/addresscolect.dart';

class ServicerBook extends StatelessWidget {
    final ServicersModel servicers;

  const ServicerBook({super.key, required this.servicers});

  @override
  Widget build(BuildContext context) {
   // final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: const CustomAppBar(
          backgroundColor: AppColors.primaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(children: [
             Stack(children: [
              JobDetailsWidget(
                jobName: servicers.serviceCategory,
                amount:'₹${servicers.amount.toString()}',
                location: servicers.location,
                name: servicers.fullname,
                imageUrl:
                    servicers.servicerImage,
              )
            ]),
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
            CustomElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>  AdressTaking(servicers: servicers),
                ));
              },
              buttonText: 'Book Now',
            )
          ]),
        ));
  }
}
