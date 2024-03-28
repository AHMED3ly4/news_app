import 'package:flutter/material.dart';
import 'package:news_app/providers/setting_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingBody extends StatelessWidget {
  const SettingBody({super.key});



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(AppLocalizations.of(context)!.language),
          DropdownMenu(
            textStyle: TextStyle(
                color: Theme.of(context).primaryColor
            ),
            expandedInsets: const EdgeInsets.all(0),
            initialSelection: Provider.of<SettingProvider>(context).appLanguage,
            onSelected: (value){
              Provider.of<SettingProvider>(context,listen: false).changeAppLanguage(value);
            },
            dropdownMenuEntries:  [
              DropdownMenuEntry(
                value: 'en',
                label: AppLocalizations.of(context)!.english,
              ),
              DropdownMenuEntry(
                value: 'ar',
                label: AppLocalizations.of(context)!.arabic,
              )
            ],
          ),
        ],
      ),
    );
  }
}
