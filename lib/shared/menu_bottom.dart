import 'package:board_game_app/pages/collections_screen.dart';
import 'package:board_game_app/pages/home_screen.dart';
import 'package:board_game_app/pages/settings_screen.dart';
import 'package:board_game_app/pages/wishlist_screen.dart';
import 'package:flutter/material.dart';

class MenuBottom extends StatelessWidget {
  const MenuBottom({
    Key? key,
  }) : super(key: key);

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;

    return BottomNavigationBar(
      onTap: (int index){
        switch (index){
          case 0:
            Navigator.push(context, MaterialPageRoute(
                builder: (context) =>
                 HomeScreen())
            );
            break;
          case 1:
            Navigator.push(context, MaterialPageRoute(
                builder: (context) =>
                    CollectionsScreen())
            );
            break;
          case 2:
            Navigator.push(context, MaterialPageRoute(
                builder: (context) =>
                    WishListScreen())
            );
            break;
          case 3:
            Navigator.push(context, MaterialPageRoute(
                builder: (context) =>
                    SettingsScreen())
            );
          break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.view_column_outlined),
          label: 'Collections',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'WishList',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      backgroundColor: Colors.black12,
      unselectedItemColor: Colors.lightBlue,
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
    );
  }


}
