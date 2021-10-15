import 'package:board_game_app/models/game.dart';
import 'package:flutter/cupertino.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key, required this.game}) : super(key: key);

  final Game game;

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.game.name.toString()),
    );
  }
}
