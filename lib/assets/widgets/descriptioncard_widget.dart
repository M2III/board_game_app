
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DescriptionCardWidget extends StatelessWidget {
  const DescriptionCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child:  Card(
        child:  SizedBox(
          height: 100,
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: <Widget>[

              Text('Hello World'),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('How are you?'),

                  Text('How are you?'),
                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('How are you?'),
                  Text('How are you?'),
                ],
              ),

            ],
          ),
        ),
      ),
    );

  }}