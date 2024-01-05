import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginImage extends StatelessWidget {
  const LoginImage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Center(
      child: SizedBox(
        width: screenSize.width * 0.7,
        height: screenSize.height * 0.3 - 20,
        child: SvgPicture.asset(
          "asset/images/login.svg",
          width: screenSize.width,
        ),
      ),
    );
  }
}
