import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';


import '../../domain/comics_domain.dart';
import '../../repository/comics_repository.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  group('ComicsRepository', ()
  {
    late ComicsRepository comicsRepository;
    late MockHttpClient mockHttpClient;

    setUpAll(() {
      registerFallbackValue(Uri.parse('http://example.com'));
    });

    setUp(() {
      mockHttpClient = MockHttpClient();
      comicsRepository = ComicsRepository();
    });

    test('getAll - Retorna ComicsDomain quando a requisição é bem-sucedida', () async {
      const mockResponse = '{"code": 200, "data": {"results": [{"id": 1, "title": "Comic 1", "thumbnail": {"path":"path", "extension": "jpg"} }]}}';
      Map<String, dynamic> jsonData = json.decode(mockResponse);
      final expectedComicsDomain = ComicsDomain.fromJson(jsonData);

      when(() => mockHttpClient.get(any())).thenAnswer((_) async =>
          http.Response(mockResponse, 200));

      final result = await comicsRepository.getAll();

      expect(result.code, equals(expectedComicsDomain.code));
    });
  });
}
