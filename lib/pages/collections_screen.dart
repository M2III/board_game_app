import '../widgets/customtextfield_widget.dart';
import '../widgets/descriptioncard_widget.dart';
import 'package:board_game_app/widgets/menu_bottom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CollectionsScreen extends StatelessWidget {
  const CollectionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //int _selectedIndex = 0;
    TextEditingController textController = TextEditingController();
    const TextStyle hintStyle = TextStyle(color: Colors.black26,);

    String hintText = "Your text";
    BorderSide borderSide = const BorderSide(color: Colors.transparent,);
    BorderRadius borderRadius = BorderRadius.circular(10.0);
    BorderRadius focusedBorderRadius = BorderRadius.circular(25.7);
    TextStyle labelStyle = const TextStyle(color: Color.fromARGB(174, 182, 191, 1), fontSize: 15, fontStyle: FontStyle.normal);
    Color fillColor = const Color.fromRGBO(255, 255, 255, 1);

    return MaterialApp(
      home: Scaffold(

        bottomNavigationBar: const MenuBottom(),
        body: Scaffold(
            body: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(height: 50),
                        CustTextField(textController: textController, hintText: hintText, hintStyle: hintStyle, labelStyle: labelStyle, fillColor: fillColor, borderSide: borderSide, focusedBorderRadius: focusedBorderRadius, borderRadius: borderRadius),
                        const SizedBox(height: 25),
                        const DescriptionCardWidget(),
                      ],
                    ),
                  )
                ]
            )
        ),
      ),
    );
  }
}

