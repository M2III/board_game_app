

import 'package:board_game_app/data/models/collections.dart';
import 'package:board_game_app/data/models/game.dart';
import 'package:board_game_app/pages/collections_screen.dart';
import 'package:board_game_app/resources/widgets/collections_list.dart';
import 'package:board_game_app/resources/widgets/medium_game_card.dart';
import 'package:board_game_app/resources/widgets/menu_bottom.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'collections_bloc.dart';

class CollectionsScreen extends StatefulWidget {

  const CollectionsScreen({Key? key, }) : super(key: key);

  @override
  _CollectionScreenState createState() => _CollectionScreenState();
}

class _CollectionScreenState extends State<CollectionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your boardgames collection'),
      ),
      bottomNavigationBar: const MenuBottom(),
      body: _getBody(),
    );
  }

  Widget _getBody() {

    if (collectionsBloc.getAllCollection()!.isNotEmpty) {
      return ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: collectionsBloc.getAllCollection()!.length,
        itemBuilder: (context, index) {
          return CollectionList(collections: collectionsBloc.getAllCollection()![index]);
        },
      );
    } else {
      return const Center(
        child: Text("No results",
            style: TextStyle(
                color: Colors.amber,
                fontSize: 20.0,
                fontWeight: FontWeight.w900)),
      );
    }

  }
}
