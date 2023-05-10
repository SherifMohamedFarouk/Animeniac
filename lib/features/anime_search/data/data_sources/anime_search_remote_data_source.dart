import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/error/exception.dart';
import '../../../../core/util/constants.dart';
import '../models/anime_search_model.dart';

abstract class AnimeSearchRemoteDataSource {
  Future<AnimeSearchModel> getAnimeSearch(String search);
}

class AnimeSearchRemoteDataSourceImpl implements AnimeSearchRemoteDataSource {
  final http.Client client;

  AnimeSearchRemoteDataSourceImpl({required this.client});
  @override
  Future<AnimeSearchModel> getAnimeSearch(search) async {
    final response = await client.get(
      Uri.parse("$baseUrl/anime?q=$search"),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      final AnimeSearchModel animeSearchModels =
          AnimeSearchModel.fromJson(decodedJson);
      return animeSearchModels;
    } else {
      throw ServerException();
    }
  }
}
