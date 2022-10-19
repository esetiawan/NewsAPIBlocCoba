import 'package:flutter/material.dart';
import '../widgets/custom_scaffold.dart';

class MoreNewsScreen extends StatelessWidget {
  static const routeName='/more_news';
  final String url;
  const MoreNewsScreen({Key? key, required this.url}):super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text("More News");/*CustomScaffold(
      body: WebView(
          initialUrl: url,
      ),
    ); */
  }
}