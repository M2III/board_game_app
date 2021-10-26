import 'package:board_game_app/widgets/menu_bottom.dart';
import 'package:board_game_app/widgets/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //int _selectedIndex = 0;

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text('Your wishlist')),
          bottomNavigationBar: const MenuBottom(),
          body: Column(
            children: const [SearchBar()],
          )),
    );
  }
}
