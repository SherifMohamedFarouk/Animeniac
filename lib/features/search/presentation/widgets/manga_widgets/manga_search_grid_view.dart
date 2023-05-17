import 'package:flutter/material.dart';

import '../../../manga_search/data/models/manga_search_model.dart';
import '../no_results.dart';
import 'manga_grid_view_card.dart';

class MangaSearchGridView extends StatelessWidget {
  const MangaSearchGridView({
    super.key,
    required this.mangaResults,
    required this.isAnime,
  });

  final MangaSearchModel mangaResults;
  final bool isAnime;

  @override
  Widget build(BuildContext context) {
    return mangaResults.data!.isEmpty
        ? const NoResults()
        : Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(vertical: 12),
              itemCount: mangaResults.data!.length,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                childAspectRatio: 0.55,
              ),
              itemBuilder: (context, index) {
                return MangaGridViewCard(
                  mangaItem: mangaResults.data![index],
                );
              },
            ),
          );
  }
}
