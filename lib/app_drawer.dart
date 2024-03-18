import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';

class AppDrawer extends StatelessWidget {

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
          padding: EdgeInsets.all(15),
          child: Text(
            'News App!',
              style:Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: AppTheme.whiteColor
              )
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Icon(Icons.menu),
              const SizedBox(width: 8,),
              Text(
                'Categories',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Icon(Icons.settings),
              const SizedBox(width: 8,),
              Text(
                'Setting',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
