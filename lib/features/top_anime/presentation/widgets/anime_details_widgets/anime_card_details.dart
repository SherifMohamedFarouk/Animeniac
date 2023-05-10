import 'package:flutter/material.dart';

import '../../../data/models/classes/anime_data.dart';

class AnimeCardDetails extends StatelessWidget {
  const AnimeCardDetails({
    super.key,
    required this.animeDetails,
  });
  final AnimeData animeDetails;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    if (animeDetails.episodes != null &&
        animeDetails.year != null &&
        animeDetails.score != null) {
      return Row(
        children: [
          if (animeDetails.episodes != null) ...[
            Text(
              'Episodes : ${animeDetails.episodes!.toString()} ,',
              style: textTheme.bodyLarge,
            ),
            // const CircleDot(),
          ],
          if (animeDetails.year != null) ...[
            Text(
              'Year : ${animeDetails.year.toString()} ,',
              style: textTheme.bodyLarge,
            ),
            // const CircleDot(),
          ] else ...[
            if (animeDetails.score != null) ...[
              // const CircleDot(),
            ]
          ],
          Text(
            'Score:',
            style: textTheme.bodyLarge,
          ),
          const Icon(
            Icons.star_rate_rounded,
            color: Colors.amber,
            size: 18,
          ),
          Text(
            animeDetails.score!.toString(),
            style: textTheme.bodyLarge,
          ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
