import 'package:board_game_app/pages/auth_screen.dart';
import 'package:board_game_app/pages/collections_screen.dart';
import 'package:board_game_app/pages/home_screen.dart';
import 'package:board_game_app/pages/register_screen.dart';
import 'package:board_game_app/pages/settings_screen.dart';
import 'package:board_game_app/pages/wishlist_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        '/': (context) => const AuthScreen(),
        '/Collections': (context) => const CollectionsScreen(),
        '/WishList': (context) => const WishListScreen(),
        '/Settings': (context) => const SettingsScreen(),
      },
      initialRoute: '/',
    );
  }
}



