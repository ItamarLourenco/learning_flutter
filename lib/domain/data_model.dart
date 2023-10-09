
import 'package:learning_flutter/domain/result_model.dart';

class DataModel {

  final List<ResultModel> results;

  DataModel({
    required this.results,
  });

  factory DataModel.fromJson(Map<String, dynamic> json){
    return DataModel(
        results: (json['results'] as List<dynamic>)
            .map((result) => ResultModel.fromJson(result))
            .toList()
    );
  }
}
