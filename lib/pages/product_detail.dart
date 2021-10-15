import 'package:board_game_app/models/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key, required this.game}) : super(key: key);

  final Game game;

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: 1,
        child: Scaffold(
          body: Column(
            children: <Widget>[
              Center(
                child : Image(
                  fit: BoxFit.cover,
                  width: 40,
                  height: 40,
                  image: NetworkImage(widget.game.imageUrl ?? ""),)
              ),
              Center(
                child: Text(
                  widget.game.name.toString()
                ),
              ),
              Center(
                child: Row(
                  children: [
                    IconButton(
                        onPressed: (){debugPrint("tapped");},
                        icon: Icon(
                          Icons.add,
                          color: Colors.green,
                          size: 40,
                        )),
                    IconButton(
                        onPressed: (){debugPrint("tapped");},
                        icon: Icon(
                          Icons.add,
                          color: Colors.red,
                          size: 40,
                        )),
                    IconButton(
                        onPressed: (){debugPrint("tapped");},
                        icon: Icon(
                          Icons.add,
                          color: Colors.blue,
                          size: 40,
                        )),
                  ],
                ),
              ),
              Center(
                child : Text(
                  widget.game.description.toString()
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
