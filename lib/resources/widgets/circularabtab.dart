
import 'package:flutter/material.dart';

class CircularTab extends StatelessWidget {
  final String text;

  const CircularTab({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width,
      height: screenSize.height*0.04,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}