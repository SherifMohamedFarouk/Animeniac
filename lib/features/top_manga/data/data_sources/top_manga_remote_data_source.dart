import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/error/exception.dart';
import '../../../../core/util/constants.dart';
import '../models/top_manga_model.dart';

abstract class TopMangaRemoteDataSource {
  Future<TopMangaModel> getTopMangas();
}

class TopMangaRemoteDataSourceImpl implements TopMangaRemoteDataSource {
  final http.Client client;

  TopMangaRemoteDataSourceImpl({required this.client});
  @override
  Future<TopMangaModel> getTopMangas() async {
    final response = await client.get(
      Uri.parse("$baseUrl/top/manga"),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      final TopMangaModel mangaModels = TopMangaModel.fromJson(decodedJson);
      return mangaModels;
    } else {
      throw ServerException();
    }
  }
}
