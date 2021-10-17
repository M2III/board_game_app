import 'package:board_game_app/pages/auth_screen.dart';
import 'package:board_game_app/pages/collections_screen.dart';
import 'package:board_game_app/pages/home_screen.dart';
import 'package:board_game_app/pages/wishlist_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MenuBottom extends StatelessWidget {
  const MenuBottom({Key? key, page}) : super(key: key);

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static String activePage = 'Home';
  static int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (int index) {
        switch (index) {
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
              PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const CollectionsScreen()),
            );
            _selectedIndex = index;
            break;
          case 2:
            Navigator.push(
              context,
              PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const WishListScreen()),
            );
            _selectedIndex = index;
            break;
          case 3:
            _settingModalBottomSheet(context);
            _selectedIndex = index;
            break;
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: isPageActive(_selectedIndex, 0)),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.view_column_outlined,
              color: isPageActive(_selectedIndex, 1)),
          label: 'Collections',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite, color: isPageActive(_selectedIndex, 2)),
          label: 'WishList',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings, color: isPageActive(_selectedIndex, 3)),
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

  Color isPageActive(int activePage, int labelPage) {
    return activePage == labelPage ? Colors.blueAccent : Colors.grey;
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.face),
                title: Text(FirebaseAuth.instance.currentUser!.email!,
                    style: TextStyle(
                        color: Colors.blue[500],
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900)),
              ),
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Edit My Profile'),
                onTap: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Sorry'),
                    content: const Text('This feature is not yet implemented'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        )),
                        child: const Text('Go HomePage'),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text('Disconnect'),
                onTap: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Do you really Want ?'),
                    content: const Text(
                        'There are still plenty of games to discover but if you decide to leave, know that the app will welcome you again later.'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        )),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => {
                          signOut(),
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>  const AuthScreen(),
                          ))
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
