import 'package:board_game_app/pages/collections_screen.dart';
import 'package:board_game_app/pages/home_screen.dart';
import 'package:board_game_app/pages/settings_screen.dart';
import 'package:board_game_app/pages/wishlist_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      routes: {
        '/': (context) => HomeScreen(),
        '/Collections': (context) => const CollectionsScreen(),
        '/WishList': (context) => const WishListScreen(),
        '/Settings': (context) => const SettingsScreen(),
      },
      initialRoute: '/',
    );
  }
}



