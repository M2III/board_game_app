import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class custCircleButton extends StatelessWidget {
  final onPressed;
  final icon;
  final color;
  final tag;
  custCircleButton({Key? key,required this.onPressed, required this.icon, required this.color, required this.tag }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(

        child: Center(
          child:FloatingActionButton(
            heroTag: tag,
            onPressed: onPressed,
            child: Icon(icon,color: color,size: 19,),
            //backgroundColor: blackPollButtonTheme,
          ),
        )
    );
  }
}