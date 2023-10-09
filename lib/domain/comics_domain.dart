import 'package:learning_flutter/domain/data_model.dart';

class ComicsDomain{
  final int code;
  final DataModel data;

  ComicsDomain({
    required this.code,
    required this.data
  });

  factory ComicsDomain.fromJson(Map<String, dynamic> json){
    return ComicsDomain(
      code: json['code'] as int,
      data: DataModel.fromJson(json['data'])
    );
  }
}


abstract class ComicsUseCaseInterface {
  Future<ComicsDomain> execute();
  Future<ComicsDomain> getById(int id);
}
abstract class ComicsRepositoryInterface {
  Future<ComicsDomain> getAll();
  Future<ComicsDomain> getById(int id);
}
