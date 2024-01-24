import 'package:flutter/material.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/resources/constant/textstyle.dart';
import 'package:userapp/resources/strings/opening.dart';
import 'package:userapp/resources/widgets/customelevatedbutton.dart';
import 'package:userapp/resources/widgets/textfieldspace.dart';
import 'package:userapp/view/signup/register.dart';

class Opening extends StatelessWidget {
  const Opening({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: screenSize.height*0.6-38,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("asset/images/opening.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
                child: Container(
              width: screenSize.width,
              color: AppColors.blackColor,
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      LoginString.textone,
                      style: AppText.xLarge,
                    ),
                    const TextFieldSpacing(),
                    Text(
                      LoginString.texttwo,
                      style: AppText.xLarge,
                    ),
                    const TextFieldSpacingBig(),
                
                    CustomElevatedButton(
                     onPressed: () {
                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => Register(),));
                     },
                      buttonText: LoginString.openingbutton ,
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
