import 'package:flutter/material.dart';

class TextFieldSpacing extends StatelessWidget {
  const TextFieldSpacing({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return SizedBox(
    height: screenSize.height / 55,
    );
  }
}


class TextFieldSpacingBig extends StatelessWidget {
  const TextFieldSpacingBig({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return SizedBox(
      height: screenSize.height*0.08
    );
  }
}

class TextFieldSpacingAverage extends StatelessWidget {
  const TextFieldSpacingAverage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return SizedBox(
      height: screenSize.height*0.04
    );
  }
}

