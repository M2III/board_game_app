
import 'package:board_game_app/shared/menu_bottom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;

    return MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('WishListScreen')),
      bottomNavigationBar: MenuBottom(),
      body: Container(
          child: Center(
              child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white70,
                  ),
                  child: const Text('WishListScreen',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 22,
                          shadows: [
                            Shadow(
                              offset: Offset(1.0,1.0),
                              blurRadius: 2.0,
                              color: Colors.grey,
                            )
                          ]
                      )
                  )
              )
          )
      ),
    ),
  );
  }
}
