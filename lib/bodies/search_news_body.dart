import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_app/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../apis/apis_services.dart';
import '../models/news_model.dart';
import '../widgets/loading_indicator.dart';
import '../widgets/news_item.dart';

class SearchNewsBody extends StatefulWidget {
  final String search;
  const SearchNewsBody({required this.search});


  @override
  State<SearchNewsBody> createState() => _SearchNewsBodyState();
}

class _SearchNewsBodyState extends State<SearchNewsBody> {
  List <NewsModel> news =[];
  int searchPage=1;
  bool isFirstLoadRunning =false;
  bool isLoadingMoreRunning =false;
  ScrollController controller =ScrollController();
  void getFirstData()async{
    setState(() {
      isFirstLoadRunning =true;
    });

      final searchResponse = await APIServices.search(search: widget.search , page: searchPage);
      if(searchResponse.status != "ok") {
        Fluttertoast.showToast(
            msg: AppLocalizations.of(context)!.noDataFound,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: AppTheme.primaryColor,
            textColor: Colors.white,
            fontSize: 16.0
        );
        return;
      }
      news =searchResponse.news!;

    setState(() {
      isFirstLoadRunning =false;
    });
  }
  void loadMoreData()async{
    if(isFirstLoadRunning ==false && isLoadingMoreRunning ==false){
      setState(() {
        isLoadingMoreRunning =true;
      });
      searchPage+=1;
        final searchResponse = await APIServices.search(search: widget.search , page: searchPage);
      if(searchResponse.status != "ok") {
        Fluttertoast.showToast(
            msg: AppLocalizations.of(context)!.noDataFound,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: AppTheme.primaryColor,
            textColor: Colors.white,
            fontSize: 16.0
        );
        return;
      }
        news.addAll(searchResponse.news!);

      setState(() {
        isLoadingMoreRunning =false;
      });
    }
  }
  void scrollListener(){
    if(controller.position.pixels ==controller.position.maxScrollExtent){
      loadMoreData();
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFirstData();
    controller.addListener(scrollListener);
  }
  @override
  Widget build(BuildContext context) {

    return isFirstLoadRunning ? LoadingIndicator():
    Column(
      children: [
        Expanded(
          child: ListView.builder(
            controller: controller,
            itemCount: news.length,
            itemBuilder: (context, index) => NewsItem(news: news[index]),
          ),
        ),
        if(isLoadingMoreRunning)
          LoadingIndicator(),
      ],
    );
  }
}
