import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app_drawer.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/bodies/categories_body.dart';
import 'package:news_app/bodies/selected_category_body.dart';
import 'package:news_app/bodies/setting_body.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/search_news_screen.dart';


class HomeScreen extends StatefulWidget {
  static const routeName='/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DrawerSelect selectedBody= DrawerSelect.categories;
  int? selectedCategoryIndex;
  bool isSearching =false;
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final notSearchingAppbar=AppBar(
      title: Text(
        selectedCategoryIndex!= null ? CategoryModel.categories[selectedCategoryIndex!].label :
        selectedBody == DrawerSelect.categories ? 'News App' : 'Settings',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      actions: [
        IconButton(
          onPressed: (){
            isSearching = !isSearching;
            setState(() {
            });
          },
          icon: Icon(Icons.search),
        )
      ],
    );
    final searchingAppbar=AppBar(
      titleSpacing: 10,
      title: Container(
        height: kToolbarHeight * 0.8,
        alignment: Alignment.bottomCenter,
        child: TextFormField(
          controller: searchController,
          onEditingComplete: (){
            Navigator.pushNamed(context,
                SearchNewsScreen.routeName,
                arguments: searchController.text
            );
          },
          style: const TextStyle(
            fontSize: 20,
          ),
          decoration: InputDecoration(
              fillColor: AppTheme.whiteColor,
              filled: true,
            suffixIcon: IconButton(
                onPressed: (){},
                icon: const Icon(Icons.search),
            ),
            prefixIcon: IconButton(
                onPressed: (){
                  isSearching = !isSearching;
                  setState(() {});
                },
                icon: const Icon(Icons.close),
            ),
            hintText: 'What are you looking for?',
            hintStyle: const TextStyle(
              fontSize: 20
            ),
            suffixIconColor: Theme.of(context).primaryColor,
            prefixIconColor: Theme.of(context).primaryColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ),
    );
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
        ),
      ),
      child: Scaffold(
        appBar: isSearching? searchingAppbar : notSearchingAppbar,
        drawer: Drawer(
          child: AppDrawer(
            onDrawerSelect: (DrawerSelect select){
              selectedBody =select;
              selectedCategoryIndex=null;
              setState(() {

              });
            },
          ),
        ),
        body: selectedCategoryIndex!= null ?
            SelectedCategoryBody(CategoryModel.categories[selectedCategoryIndex!].id):
        selectedBody == DrawerSelect.categories ?
        CategoriesBody((int index){
          selectedCategoryIndex =index;
          setState(() {});
        }) :
        SettingBody(),
      ),
    );
  }
}
