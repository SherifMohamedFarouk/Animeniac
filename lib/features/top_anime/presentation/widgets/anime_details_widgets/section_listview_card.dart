import 'package:animeniac/features/top_anime/data/models/classes/anime_data.dart';
import 'package:animeniac/features/top_anime/presentation/views/anime_details.dart';
import 'package:flutter/material.dart';

import '../../../../../core/global_widgets/image_with_shimmer.dart';
import '../../../../../core/navigation/custom_navigation.dart';
import '../../../../../core/navigation/routes.dart';

class SectionListViewCard extends StatelessWidget {
  const SectionListViewCard({
    super.key,
    required this.animeDetails,
  });
  final AnimeData animeDetails;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              CustomNavigator.push(Routes.ANIME_DETAILS,
                  arguments: animeDetails);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ImageWithShimmer(
                imageUrl: animeDetails.images!.jpg!.largeImageUrl.toString(),
                width: double.infinity,
                height: 175,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                animeDetails.titleEnglish!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodyMedium,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_rate_rounded,
                    color: Colors.amber,
                    size: 18,
                  ),
                  Text(
                    '${animeDetails.score}/10',
                    style: textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
