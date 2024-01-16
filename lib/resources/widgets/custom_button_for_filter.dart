import 'package:flutter/material.dart';


class CustomButtonForCouponApplyType extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressedFunction;
  const CustomButtonForCouponApplyType(
      {super.key,
      required this.text,
      required this.color,
      required this.onPressedFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(7)),
      child: ElevatedButton(
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(color)),
          onPressed: onPressedFunction,
          child:Text(text,)),
    );
  }
}