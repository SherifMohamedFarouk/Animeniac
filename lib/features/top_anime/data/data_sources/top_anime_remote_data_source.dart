import 'package:animeniac/core/util/constants.dart';
import 'package:animeniac/features/top_anime/data/models/top_anime_model.dart';
import 'package:dartz/dartz.dart';
import 'dart:convert';

import '../../../../core/error/exception.dart';

import 'package:http/http.dart' as http;

abstract class TopAnimeRemoteDataSource {
  Future<TopAnimeModel> getTopAnimes();
}

class TopAnimeRemoteDataSourceImpl implements TopAnimeRemoteDataSource {
  final http.Client client;

  TopAnimeRemoteDataSourceImpl({required this.client});
  @override
  Future<TopAnimeModel> getTopAnimes() async {
    final response = await client.get(
      Uri.parse("$baseUrl/top/anime"),
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
