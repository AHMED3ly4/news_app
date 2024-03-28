import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/home_screen.dart';
import 'package:news_app/providers/setting_provider.dart';
import 'package:news_app/screens/news_screen.dart';
import 'package:news_app/screens/search_news_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context) => SettingProvider(),
      child: NewsApp(),
    )
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
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      locale: Locale(Provider.of<SettingProvider>(context).appLanguage),
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}
