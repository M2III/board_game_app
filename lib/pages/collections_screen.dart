import 'package:board_game_app/widgets/menu_bottom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/search_bar.dart';

class CollectionsScreen extends StatelessWidget {
  const CollectionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Scaffold(
          body: SearchBar(),
        ),
        bottomNavigationBar: MenuBottom(),
      ),
    );
  }
}
