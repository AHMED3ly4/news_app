import 'package:flutter/material.dart';

import '../models/category_model.dart';
import '../widgets/category_item.dart';

class CategoriesBody extends StatelessWidget {
  void Function(int index) onCategorySelected;
  CategoriesBody( this.onCategorySelected);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Pick your category of interest',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.92
            ),
            itemBuilder: (_, index) => InkWell(
              onTap: (){
                onCategorySelected(index);
              },
                child: CategoryItem(category: CategoryModel.categories[index], index: index)),
            itemCount: CategoryModel.categories.length,
          ),
        )
      ],
    );
  }
}
