import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app_drawer.dart';
import 'package:news_app/app_theme.dart';

class HomeScreen extends StatelessWidget {
  static const routeName='/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News App',
        style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      drawer: Drawer(
        child: AppDrawer(),
      ),
      body: Column(
        children: [
          Text(
            'Pick your category of interest',
          style: Theme.of(context).textTheme.bodyMedium,
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,

                ),
                itemBuilder: (_, index) => Container(
                  height: MediaQuery.of(context).size.height*0.2,
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: AppTheme.redColor,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    children: [
                      Image.asset('assets/images/sports.png'),
                      Text('Sports',
                      style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              itemCount: 6,
            ),
          )
        ],
      ),
    );
  }
}
