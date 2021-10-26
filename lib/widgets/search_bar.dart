import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  static final TextEditingController textController = TextEditingController();

  const SearchBar({Key? key}) : super(key: key);

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
            const SizedBox(height: 50),
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
      controller: textController,
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
          prefixIcon: const Icon(Icons.email),
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
          )),
    );
  }
}
