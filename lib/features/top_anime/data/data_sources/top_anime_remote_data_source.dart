import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/error/exception.dart';
import '../../../../core/util/constants.dart';
import '../models/top_anime_model.dart';

abstract class TopAnimeRemoteDataSource {
  Future<TopAnimeModel> getTopAnimes(pageIndex);
}

class TopAnimeRemoteDataSourceImpl implements TopAnimeRemoteDataSource {
  final http.Client client;

  TopAnimeRemoteDataSourceImpl({required this.client});
  @override
  Future<TopAnimeModel> getTopAnimes(pageIndex) async {
    final response = await client.get(
      Uri.parse("$baseUrl/top/anime?page=$pageIndex"),
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      final TopAnimeModel animeModels = TopAnimeModel.fromJson(decodedJson);
      return animeModels;
    } else {
      throw ServerException();
    }
  }
}
