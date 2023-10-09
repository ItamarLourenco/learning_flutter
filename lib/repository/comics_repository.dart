import 'dart:convert';
import 'package:http/http.dart' as http;
import '../api/config/config.dart';
import '../domain/comics_domain.dart';

class ComicsRepository implements ComicsRepositoryInterface {
  @override
  Future<ComicsDomain> getAll() async {
    final response = await http.get(handleUrl());
    if (response.statusCode == 200) {
      return ComicsDomain.fromJson(json.decode(response.body));
    } else {
      throw Exception('Ocorreu um erro ao tentar buscar informações na API');
    }
  }

  @override
  Future<ComicsDomain> getById(int id) async {
    final response = await http.get(handleUrl(id: id));
    if (response.statusCode == 200) {
      return ComicsDomain.fromJson(json.decode(response.body));
    } else {
      throw Exception('Ocorreu um erro ao tentar buscar informações na API');
    }
  }


  Uri handleUrl({int? id}) {
    if (id != null) {
      return Uri.parse('${Config.endpoint}/$id?ts=${Config.ts}&apikey=${Config.apikey}&hash=${Config.hash}');
    }
    return Uri.parse('${Config.endpoint}?ts=${Config.ts}&apikey=${Config.apikey}&hash=${Config.hash}');
  }
}

