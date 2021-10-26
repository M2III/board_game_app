import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

/**
 * Classe Utilitaire permettant d'intépreter l'HTML récupéré par l'API
 */
class ToHtml extends StatelessWidget {
  final String html;
  const ToHtml({Key? key,var data, required this.html}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Html(data:html);
  }
}
