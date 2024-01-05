import 'package:flutter/material.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/resources/constant/textstyle.dart';
import 'package:userapp/resources/widgets/catogoriescard.dart';

import 'package:userapp/resources/widgets/customappbar.dart';
import 'package:userapp/view/catogories/book/servicerview.dart';

class Others extends StatelessWidget {
  const Others({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          backgroundColor: AppColors.primaryColor,
          title: Text(
            'Others',
            style: AppText.labeltext,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: [
              CategoriesCard(
                amount: '200',
                imageUrl: 'https://robycstechnology.com.au/wp-content/uploads/2020/05/Depositphotos_59479305_l-2015-1024x683.jpg ',
                jobName: 'Plumber',
                name: 'Anshif',
                onTap: () {
               //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ServicerBook(),));
                },
          
              )
            ],
          ),
        ),
      ),
    );
  }
}
