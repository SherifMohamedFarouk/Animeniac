import 'package:flutter/material.dart';

import '../../../anime_search/data/models/anime_search_model.dart';
import '../no_results.dart';
import 'anime_grid_view_card.dart';

class AnimeSearchGridView extends StatelessWidget {
  const AnimeSearchGridView({
    super.key,
    required this.animeResults,
    required this.isAnime,
  });

  final AnimeSearchModel animeResults;
  final bool isAnime;

  @override
  Widget build(BuildContext context) {
    return animeResults.data!.isEmpty
        ? const NoResults()
        : Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(vertical: 12),
              itemCount: animeResults.data!.length,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                childAspectRatio: 0.55,
              ),
              itemBuilder: (context, index) {
                return AnimeGridViewCard(
                  animeItem: animeResults.data![index],
                );
              },
            ),
          );
  }
}
