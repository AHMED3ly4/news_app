import 'news_model.dart';

class NewsResponseModel {
  NewsResponseModel({
    required this.status,
    required this.totalResults,
    required this.news,
  });
  late final String? status;
  late final int? totalResults;
  late final List<NewsModel> news;

  NewsResponseModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    totalResults = json['totalResults'];
    news = List.from(json['articles']).map((e)=>NewsModel.fromJson(e)).toList();
  }


}