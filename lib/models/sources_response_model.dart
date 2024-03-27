import 'package:news_app/models/sources_model.dart';

class SourcesResponseModel{
  late final String? status;
  late final List<SourcesModel> sources;

  SourcesResponseModel({
    required this.status,
    required this.sources,
  });


  SourcesResponseModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    sources = List.from(json['sources']).map((e)=>SourcesModel.fromJson(e)).toList();
  }



}