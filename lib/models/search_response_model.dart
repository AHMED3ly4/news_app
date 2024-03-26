
import 'package:news_app/models/news_model.dart';

class SearchResponseModel {
  SearchResponseModel({
    required this.status,
    required this.totalResults,
    required this.news,
  });
  late final String? status;
  late final int? totalResults;
  late final List<NewsModel>? news;

  SearchResponseModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    totalResults = json['totalResults'];
    news = List.from(json['articles']).map((e)=>NewsModel.fromJson(e)).toList();
  }

}