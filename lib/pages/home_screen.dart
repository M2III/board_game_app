import 'package:board_game_app/widgets/menu_bottom.dart';
import 'package:board_game_app/widgets/mini_game_list_container.dart';
import 'package:board_game_app/widgets/search_bar.dart';
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
          title: const Text('BoardgameApp'),
        ),
        bottomNavigationBar: const MenuBottom(),
        body: Center(
          child: Column(
            children: const <Widget>[
              SearchBar(),
              MiniGameListContainer(MiniGameListContainer.bestKickstarters),
              MiniGameListContainer(MiniGameListContainer.bestRated),
            ],
          ),
        ),
      ),
    );
  }
}
