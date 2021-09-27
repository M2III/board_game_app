
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


class  ApiSearch extends StatefulWidget {
  const ApiSearch({Key? key, required this.game_name}) : super(key: key);

  final String game_name;

  @override
  _ApiSearchState createState() => _ApiSearchState();

}

class _ApiSearchState extends State<ApiSearch> {

  Future<void> getGames() async{

    var endpointUrl = 'https://api.boardgameatlas.com/api/search';
    Map<String, String> queryParams = {
      'name': widget.game_name,
      'pretty': 'true',
      'client_id' : 'JLBr5npPhV'
    };

    String queryString = Uri(queryParameters: queryParams).query;

    var uri = Uri.parse(endpointUrl + '?' + queryString); // result - https://api.boardgameatlas.com/api/search?name=Catan&pretty=true&client_id=JLBr5npPhV
    var responseFromApi = await http.get(uri);


  }
}
