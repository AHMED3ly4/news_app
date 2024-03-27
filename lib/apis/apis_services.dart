
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/apis/apis_constants.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/models/news_response_model.dart';
import 'package:news_app/models/search_response_model.dart';
import 'package:news_app/models/sources_response_model.dart';

class APIServices{

  static Future<SourcesResponseModel> getSources(String categoryId)async {
    try{
      final uri = Uri.https(
          ApisConstants.authority,
          ApisConstants.sourcesEndPoint,
          {
            "apiKey":ApisConstants.apiKey,
            "category":categoryId,
          }
      );
      final response = await http.get(uri);
      final json = jsonDecode(response.body);
      return SourcesResponseModel.fromJson(json);
    }catch(error){
      Fluttertoast.showToast(
          msg: "No data",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      Fluttertoast.showToast(
          msg: "no data found",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppTheme.primaryColor,
          textColor: Colors.white,
          fontSize: 16.0
      );
      rethrow;
    }
  }

  static Future<NewsResponseModel> getNews (String? sources) async {
    try{
      final uri =Uri.https(
          ApisConstants.authority,
          ApisConstants.newsEndPoint,
          {
            "apiKey":ApisConstants.apiKey,
            "sources":sources
          }
      );
      final response = await http.get(uri);
      final json= jsonDecode(response.body);
      return NewsResponseModel.fromJson(json);
    }catch(error){
      Fluttertoast.showToast(
          msg: "no data found",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppTheme.primaryColor,
          textColor: Colors.white,
          fontSize: 16.0
      );
      rethrow;
    }
  }

  static Future <SearchResponseModel> search({required String search,required int page, int pageSize =20}) async{
    try{
      final uri =Uri.https(
          ApisConstants.authority,
          ApisConstants.searchEndPoint,
          {
            "apiKey":ApisConstants.apiKey,
            "q":search,
            "from": DateTime.now().subtract(const Duration(days: 2)).toIso8601String(),
            "pageSize":pageSize.toString(),
            "page":page.toString(),

          }
      );
      final response =await http.get(uri);
      final json = jsonDecode(response.body);
      return SearchResponseModel.fromJson(json);
    }catch(e){
      Fluttertoast.showToast(
          msg: "no data found",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppTheme.primaryColor,
          textColor: Colors.white,
          fontSize: 16.0
      );
      rethrow;
    }
  }
}