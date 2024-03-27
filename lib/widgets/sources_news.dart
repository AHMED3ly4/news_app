import 'package:flutter/material.dart';
import 'package:news_app/models/sources_model.dart';
import 'package:news_app/widgets/news_item.dart';
import 'package:news_app/widgets/tab_bar_item.dart';

import '../apis/apis_services.dart';


class SourceNews extends StatefulWidget {
  final List <SourcesModel?> sources;
  const SourceNews({required this.sources});

  @override
  State<SourceNews> createState() => _SourceNewsState();
}

class _SourceNewsState extends State<SourceNews> {
  int selectedTabBarItemIndex=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8
          ),
          child: DefaultTabController(
            initialIndex: selectedTabBarItemIndex,
            length: widget.sources.length ,
            child: TabBar(
              onTap: (selectedIndex) {
                selectedTabBarItemIndex=selectedIndex;
                setState(() {});
              },
              dividerColor: Colors.transparent,
              isScrollable: true,
              indicatorColor: Colors.transparent,
              tabs: widget.sources.map((sourceModel) => TabBarItem(label: sourceModel!.name ?? '', isSelected:widget.sources[selectedTabBarItemIndex]!.id == sourceModel.id )).toList(),
            ),
          ),
        ),
        FutureBuilder(
            future: APIServices.getNews(widget.sources[selectedTabBarItemIndex]!.id),
            builder: (context, newsResponseModel) {
              if(newsResponseModel.connectionState == ConnectionState.waiting ){
                return const Center(child: CircularProgressIndicator(),);
              }else if(newsResponseModel.hasError || newsResponseModel.data!.status != 'ok'){
                return const Text('Something went wrong!');
              }
              final news = newsResponseModel.data?.news  ;
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => NewsItem(news: news![index]),
                  itemCount: news?.length,
                ),
              );
            }
        ),
      ],
    );
  }
}
