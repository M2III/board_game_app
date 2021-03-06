import 'package:board_game_app/resources/widgets/menu_bottom.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //int _selectedIndex = 0;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('SettingsScreen')),
        bottomNavigationBar: const MenuBottom(),
        body: Center(
            child: Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white70,
                ),
                child: const Text('SettingsScreen',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22, shadows: [
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 2.0,
                        color: Colors.grey,
                      )
                    ])))),
      ),
      debugShowCheckedModeBanner: false,

    );
  }
}
