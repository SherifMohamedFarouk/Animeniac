import 'no_results.dart';
import 'package:flutter/material.dart';

import '../../data/models/anime_search_model.dart';
import 'grid_view_card.dart';

class SearchGridView extends StatelessWidget {
  const SearchGridView({
    super.key,
    required this.results,
  });

  final AnimeSearchModel results;

  @override
  Widget build(BuildContext context) {
    return results.data!.isEmpty
        ? const NoResults()
        : Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(vertical: 12),
              itemCount: results.data!.length,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                childAspectRatio: 0.55,
              ),
              itemBuilder: (context, index) {
                return GridViewCard(item: results.data![index]);
              },
            ),
          );
  }
}
