import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';

class CategoryModel{
  final String id;
  final String label;
  final String imageName;
  final Color color;

  CategoryModel({
        required this.id,
        required this.label,
        required this.imageName,
        required this.color,

      });

  static List<CategoryModel> categories=[
    CategoryModel(
        id: 'sports',
        label: 'Sports',
        imageName: 'sports',
        color: AppTheme.redColor,
    ),
    CategoryModel(
        id: 'general',
        label: 'General',
        imageName: 'general',
        color: AppTheme.lightBlueColor,
    ),
    CategoryModel(
        id: 'health',
        label: 'Health',
        imageName: 'health',
        color: AppTheme.roseColor,
    ),
    CategoryModel(
        id: 'business',
        label: 'Business',
        imageName: 'bussines',
        color: AppTheme.orangeColor,
    ),
    CategoryModel(
        id: 'technology',
        label: 'Technology',
        imageName: 'environment',
        color: AppTheme.fadedBlue,
    ),
    CategoryModel(
        id: 'science',
        label: 'Science',
        imageName: 'science',
        color: AppTheme.yellow,
    ),
  ];

}