import 'package:flutter/material.dart';
import 'package:userapp/resources/constant/colors.dart';
import 'package:userapp/resources/constant/textstyle.dart';

class SignUpTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Icon? prefixIcon;
  final String? hintText;
  final String? Function(String?)? validator;
  final String? label;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final bool obscureText;
  final TextInputType keyboardType;
  final int? maxLines;
  final int? maxLength;
  final bool readOnly;

  const SignUpTextField({
    Key? key,
    this.controller,
    this.prefixIcon,
    this.hintText,
    this.validator,
    this.label,
    this.labelStyle,
    this.hintStyle,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.maxLines,
    this.maxLength,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            style: labelStyle,
          ),
        TextFormField(
          enabled: !readOnly,
          readOnly: readOnly,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          style: AppText.labeltext,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            filled: true,
            fillColor: AppColors.backgroundColor,
            prefixIcon: prefixIcon,
            hintText: hintText,
            hintStyle: hintStyle,
            labelStyle: const TextStyle(color: Colors.white),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2.0),
          
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 2.0),
             
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
