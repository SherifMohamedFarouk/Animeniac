import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../../core/error/exception.dart';
import '../../../../../core/util/constants.dart';
import '../models/manga_search_model.dart';

abstract class MangaSearchRemoteDataSource {
  Future<MangaSearchModel> getMangaSearch(String search);
}

class MangaSearchRemoteDataSourceImpl implements MangaSearchRemoteDataSource {
  final http.Client client;

  MangaSearchRemoteDataSourceImpl({required this.client});
  @override
  Future<MangaSearchModel> getMangaSearch(search) async {
    final response = await client.get(
      Uri.parse("$baseUrl/manga?q=$search"),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      final MangaSearchModel mangaSearchModels =
          MangaSearchModel.fromJson(decodedJson);
      return mangaSearchModels;
    } else {
      throw ServerException();
    }
  }
}
