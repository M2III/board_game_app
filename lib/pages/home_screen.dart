import 'package:board_game_app/resources/widgets/menu_bottom.dart';
import 'package:board_game_app/resources/widgets/mini_game_list_container.dart';
import 'package:board_game_app/resources/widgets/search_bar.dart';
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
          body: _getBody()),
    );
  }

  _getBody() {
    return SingleChildScrollView(
      child: Column(
        children: const <Widget>[
          SearchBar(),
          MiniGameListContainer(MiniGameListContainer.bestKickstarters),
          MiniGameListContainer(MiniGameListContainer.bestRated),
        ],
      ),
    );
  }
}
