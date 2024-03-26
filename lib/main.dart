import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_app/apis/apis_services.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/home_screen.dart';
import 'package:news_app/providers/setting_provider.dart';
import 'package:news_app/screens/news_screen.dart';
import 'package:news_app/screens/search_news_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    NewsApp()
  );
}

class NewsApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),
        NewsScreen.routeName : (context) =>NewsScreen(),
        SearchNewsScreen.routeName : (context) =>SearchNewsScreen(),
      },
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}
