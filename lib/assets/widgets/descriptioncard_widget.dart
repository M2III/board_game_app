
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DescriptionCardWidget extends StatelessWidget {
  const DescriptionCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
        child:  SizedBox(
          width: 700,
          height: 100,
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.network("https://images.unsplash.com/photo-1593642532744-d377ab507dc8?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1169&q=80"),
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
      );


  }}