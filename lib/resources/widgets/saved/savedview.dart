import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/bloc/saved/bloc/saved_bloc.dart';
import 'package:userapp/models/savedmodel.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/resources/constant/textstyle.dart';
import 'package:userapp/resources/widgets/customappbar.dart';
import 'package:userapp/resources/widgets/customelevatedbutton.dart';
import 'package:userapp/resources/widgets/saved/job_detail_forsaved.dart';
import 'package:userapp/resources/widgets/saved/location_saved.dart';
import 'package:userapp/resources/widgets/textfieldspace.dart';

class Savedview extends StatelessWidget {
  final SavedModel servicers;
  int? index;

  Savedview({super.key, required this.servicers, this.index});

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
              BlocBuilder<SavedBloc, SavedState>(
                builder: (context, state) {
                  if(state is GetSavedDataSuccessState){
                     return JobDetailsForSavedWidget(
                      savedModel: state.savedList,
                    servicers: servicers,
                    index: index!,
                    jobName: servicers.serviceCategory,
                    amount: '₹${servicers.amount.toString()}',
                    location: servicers.location,
                    name: servicers.fullname,
                    imageUrl: servicers.servicerImage,
                  );
                  }
                  return const SizedBox();
                },
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
                style: AppText.smalldestext,
              ),
            ),
            const TextFieldSpacing(),
            CustomElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AdressTakingSaved(servicers: servicers),
                ));
              },
              buttonText: 'Book Now',
            )
          ]),
        ));
  }
}
