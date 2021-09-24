import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final String label;
  final onPressed;
  final String buttonColor;

  static const Color color = Color.fromRGBO(255, 255, 255, 1.0);

  CustomButton({Key? key, required this.label, this.onPressed, required this.buttonColor, required radius}) : super(key: key);

  final ButtonStyle style = ElevatedButton.styleFrom(primary: Colors.red, textStyle: const TextStyle(fontSize: 20,color:  color),shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25.7),
  ) );

  @override
  Widget build(BuildContext context) {

    return  Expanded(child: SizedBox(
          height: 50, //height of button
          width: MediaQuery
              .of(context)
              .size
              .width, //width of button
          child: ElevatedButton(
            child: Center(
              child: Text(label),
            ),
            onPressed: onPressed,
            style: style,
          ),
        ),
        );
  }

}















