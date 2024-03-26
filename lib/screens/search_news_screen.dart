import 'package:flutter/material.dart';
import 'package:news_app/apis/apis_services.dart';
import 'package:news_app/bodies/search_news_body.dart';


class SearchNewsScreen extends StatefulWidget {
  static const routeName='search news route name';

  @override
  State<SearchNewsScreen> createState() => _SearchNewsScreenState();
}

class _SearchNewsScreenState extends State<SearchNewsScreen> {

  @override
  Widget build(BuildContext context) {
    final search = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          search,
        ),
      ),
      body: SearchNewsBody(search: search),
    );
  }
}
