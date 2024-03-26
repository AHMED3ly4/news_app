import 'package:flutter/material.dart';
import 'package:news_app/apis/apis_services.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/models/sources_model.dart';
import 'package:news_app/widgets/sources_news.dart';
import 'package:news_app/widgets/tab_bar_item.dart';

class SelectedCategoryBody extends StatefulWidget {
final String categoryId;

const SelectedCategoryBody(this.categoryId);

  @override
  State<SelectedCategoryBody> createState() => _SelectedCategoryBodyState();
}

class _SelectedCategoryBodyState extends State<SelectedCategoryBody> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:  APIServices.getSources(widget.categoryId),
        builder: (context, sourcesResponseModel) {
          if(sourcesResponseModel.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }else if(sourcesResponseModel.hasError || sourcesResponseModel.data!.status != 'ok'){
            return const Text('Something went wrong!');
          }
           final sources =sourcesResponseModel.data?.sources ;
          return SourceNews(sources: sources!);
        },
    );
  }
}
