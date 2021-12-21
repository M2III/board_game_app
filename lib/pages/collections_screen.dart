import 'package:board_game_app/resources/widgets/menu_bottom.dart';
import 'package:board_game_app/resources/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class CollectionsScreen extends StatelessWidget {
  const CollectionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Your boardgames collection"),
        ),
        body: const SearchBar(),
        bottomNavigationBar: const MenuBottom(),
      ),
    );
  }
}
