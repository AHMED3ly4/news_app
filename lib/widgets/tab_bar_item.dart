import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';

class TabBarItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  const TabBarItem({required this.label, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isSelected? Theme.of(context).primaryColor: AppTheme.whiteColor,
        border: Border.all(
          color: Theme.of(context).primaryColor,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected?  AppTheme.whiteColor : Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
