
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustTextField extends StatelessWidget {
  const CustTextField({
    Key? key,
    required this.textController,
    required this.hintText,
    required this.hintStyle,
    required this.labelStyle,
    required this.fillColor,
    required this.borderSide,
    required this.focusedBorderRadius,
    required this.borderRadius,
  }) : super(key: key);

  final TextEditingController textController;
  final String hintText;
  final TextStyle hintStyle;
  final TextStyle labelStyle;
  final Color fillColor;
  final BorderSide borderSide;
  final BorderRadius focusedBorderRadius;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: hintStyle,
          labelStyle: labelStyle,
          filled: true,
          fillColor: fillColor,
          prefixIcon: const Icon(Icons.email),
          focusedBorder: OutlineInputBorder(
            borderSide: borderSide,
            borderRadius: focusedBorderRadius,
          ),
          border: OutlineInputBorder(
            borderSide: borderSide,
            borderRadius: borderRadius,
          )
      ),
      //keyboardType: ,
    );
  }
}