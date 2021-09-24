import 'package:board_game_app/assets/widgets/descriptioncard_widget.dart';
import 'package:board_game_app/shared/menu_bottom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    TextEditingController textController = TextEditingController();
    const TextStyle hintStyle = TextStyle(color: Colors.grey,);


    return MaterialApp(
      home: Scaffold(
        //CustomTextFieldWidget(hintText: null, hintStyle: null, mKeyboardtype: null, fieldController: null,),
        bottomNavigationBar: MenuBottom(),
        body: Scaffold(
            backgroundColor: Colors.blueGrey,
            body: Center(
                child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white70,
                    ),
                    child: DescriptionCardWidget()
                )
            )
        ),
      ),
    );
  }
}
