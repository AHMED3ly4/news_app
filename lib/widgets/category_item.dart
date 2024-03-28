import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../app_theme.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    required this.category,
    required this.index,
  });
  final CategoryModel category;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.only(bottom: 8,top: 2),
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(20),
          topRight: const Radius.circular(20),
          bottomLeft: index.isEven ? const Radius.circular(0):const Radius.circular(20),
          bottomRight: index.isOdd ? const Radius.circular(0):const Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Image.asset('assets/images/${category.imageName}.png',),
          const Spacer(),
          Text(
            AppLocalizations.of(context)!.categoriesLabel(category.label),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
