

import 'package:learning_flutter/domain/thumbnail_model.dart';

class ResultModel{
  final int id;
  final String title;
  final String description;
  final String image;
  final ThumbnailModel thumbnail;

  ResultModel({
    required this.id, 
    required this.title, 
    required this.description, 
    required this.image, 
    required this.thumbnail
  });

  factory ResultModel.fromJson(Map<String, dynamic> json){
    return ResultModel(
      id: json["id"] as int,
      title: json["title"] as String,
      description: json["description"] ?? "Sem descrição",
      image: json["image"] ?? "",
      thumbnail: ThumbnailModel.fromJson(json["thumbnail"]),
    );
  }
}