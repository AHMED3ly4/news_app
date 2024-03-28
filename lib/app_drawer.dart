import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
enum DrawerSelect {
categories,
settings;
}
class AppDrawer extends StatelessWidget {
  final void Function(DrawerSelect selected) onDrawerSelect;
  AppDrawer({ required this.onDrawerSelect});
  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          color: Theme.of(context).primaryColor,
          height: screenSize.height *0.2,
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.all(15),
          child: Text(
            '${AppLocalizations.of(context)!.newsApp}!',
              style:Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: AppTheme.whiteColor
              )
          ),
        ),
        InkWell(
          onTap: (){
            onDrawerSelect(DrawerSelect.categories);
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(Icons.menu),
                const SizedBox(width: 8,),
                Text(
                  AppLocalizations.of(context)!.categories,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: (){
            onDrawerSelect(DrawerSelect.settings);
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(Icons.settings),
                const SizedBox(width: 8,),
                Text(
                  AppLocalizations.of(context)!.setting,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
