import 'package:flutter/material.dart';

import '../../../data/models/classes/manga_data.dart';

class MangaCardDetails extends StatelessWidget {
  const MangaCardDetails({
    super.key,
    required this.mangaDetails,
  });
  final MangaData mangaDetails;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    if (mangaDetails.chapters != null &&
        mangaDetails.published!.prop!.from!.year != null &&
        mangaDetails.score != null) {
      return Row(
        children: [
          if (mangaDetails.chapters != null) ...[
            Text(
              'Episodes : ${mangaDetails.chapters!.toString()} ,',
              style: textTheme.bodyLarge,
            ),
            // const CircleDot(),
          ],
          if (mangaDetails.published!.prop!.from!.year != null) ...[
            Text(
              'Year : ${mangaDetails.published!.prop!.from!.year.toString()} ,',
              style: textTheme.bodyLarge,
            ),
            // const CircleDot(),
          ] else ...[
            if (mangaDetails.score != null) ...[
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
            mangaDetails.score!.toString(),
            style: textTheme.bodyLarge,
          ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
