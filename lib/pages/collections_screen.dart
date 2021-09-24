import 'package:board_game_app/shared/menu_bottom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CollectionsScreen extends StatelessWidget {
  const CollectionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    TextEditingController textController = TextEditingController();
    const String hintText = "Your text";
    const BorderSide borderSide = BorderSide(color: Colors.transparent,);
    BorderRadius borderRadius = BorderRadius.circular(10.0);
    BorderRadius focusedBorderRadius = BorderRadius.circular(25.7);
    const TextStyle hintStyle = TextStyle(color: Colors.grey,);
    const TextStyle labelStyle = TextStyle(color: Color.fromARGB(174, 182, 191, 1), fontSize: 15, fontStyle: FontStyle.normal);
    const Color fillColor = Color.fromRGBO(255, 51, 230, 1);




    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('CollectionsScreen')),
        bottomNavigationBar:MenuBottom(),
        body: Container(

            child: Center(
                child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white70,
                    ),
                    child: /*const Text('CollectionsScreen',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 22,
                            shadows: [
                              Shadow(
                                offset: Offset(1.0,1.0),
                                blurRadius: 2.0,
                                color: Colors.grey,
                              )
                            ]
                        )
                    )*/
                  Column(
                    children: [
                      TextField(
                        controller: textController,
                        decoration: InputDecoration(
                        hintText: hintText,
                        hintStyle: hintStyle,
                        labelStyle: labelStyle,
                        filled: true,
                        fillColor: fillColor,
                          prefixIcon: const Icon(Icons.search),
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
                      ),
                      ],
                    )
            )
        ),
      ),
    ));
  }
}
