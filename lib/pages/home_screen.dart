import 'package:board_game_app/services/api_search.dart';
import 'package:board_game_app/widgets/menu_bottom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController emailController = TextEditingController();
  String inputValue = "";

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        bottomNavigationBar: const MenuBottom(),
        body: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                TextField(
                onSubmitted: (String value) async {
                  inputValue = value;
                  debugPrint(inputValue);
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context)=> ApiSearch(gameName: inputValue),));
          },
            ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}



