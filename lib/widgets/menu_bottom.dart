import 'package:board_game_app/pages/collections_screen.dart';
import 'package:board_game_app/pages/home_screen.dart';
import 'package:board_game_app/pages/settings_screen.dart';
import 'package:board_game_app/pages/wishlist_screen.dart';
import 'package:flutter/material.dart';

class MenuBottom extends StatelessWidget {

  const MenuBottom({
    Key? key,
    page
  }) : super(key: key);

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static String activePage = 'Home';
  static int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int index){
        switch (index){
          case 0:
            Navigator.push(
              context,
              PageRouteBuilder(pageBuilder: (_, __, ___) => const HomeScreen()),
            );
            _selectedIndex = index;
          break;
          case 1:
            Navigator.push(
              context,
              PageRouteBuilder(pageBuilder: (_, __, ___) => const CollectionsScreen()),
            );
            _selectedIndex = index;
            break;
          case 2:
            Navigator.push(
              context,
              PageRouteBuilder(pageBuilder: (_, __, ___) => const WishListScreen()),
            );
            _selectedIndex = index;
            break;
          case 3:
            Navigator.push(
              context,
              PageRouteBuilder(pageBuilder: (_, __, ___) => const SettingsScreen()),
            );
            _selectedIndex = index;
            break;
        }

      },
      items:  [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: isPageActive(_selectedIndex,0)),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.view_column_outlined, color: isPageActive(_selectedIndex,1)),
          label: 'Collections',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite, color: isPageActive(_selectedIndex,2)),
          label: 'WishList',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings, color: isPageActive(_selectedIndex,3)),
          label: 'Settings',
        ),
      ],
      currentIndex: _selectedIndex,
      backgroundColor: Colors.black12,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.blueAccent,

    );

  }

  Color isPageActive(int activePage, int labelPage){
    return activePage==labelPage ? Colors.blueAccent : Colors.grey;
  }
}
