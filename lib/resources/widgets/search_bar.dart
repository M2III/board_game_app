
import 'package:board_game_app/pages/searchResult/search_result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _textController = TextEditingController();

  void _submitData() {
    if (_textController.text.isEmpty) {
      return;
    }

    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => SearchResultScreen(
          inputSearch: _textController.text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: [
            getSearchField(),
            const SizedBox(height: 25),
            //DescriptionCardWidget(game: null,),
          ],
        ),
      )
    ]);
  }

  Widget getSearchField() {
    return TextField(
      controller: _textController,
      decoration: InputDecoration(
        hintText: "Search a game...",
        hintStyle: const TextStyle(
          color: Colors.black26,
        ),
        labelStyle: const TextStyle(
            color: Color.fromARGB(174, 182, 191, 1),
            fontSize: 15,
            fontStyle: FontStyle.normal),
        filled: true,
        fillColor: const Color.fromRGBO(255, 255, 255, 1),
        prefixIcon: const Icon(Icons.search),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(25.7),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onSubmitted: (_) => _submitData(),
    );
  }
}
