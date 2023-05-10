import 'package:flutter/material.dart';

import '../../../../../core/global_widgets/image_with_shimmer.dart';
import '../../../../../core/navigation/custom_navigation.dart';
import '../../../../../core/navigation/routes.dart';
import '../../../data/models/classes/manga_data.dart';

class MangaSectionListViewCard extends StatelessWidget {
  const MangaSectionListViewCard({
    super.key,
    required this.mangaDetails,
  });
  final MangaData mangaDetails;
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
              CustomNavigator.push(Routes.MANGA_DETAILS,
                  arguments: mangaDetails);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ImageWithShimmer(
                imageUrl: mangaDetails.images!.jpg!.largeImageUrl.toString(),
                width: double.infinity,
                height: 175,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mangaDetails.titleEnglish ?? mangaDetails.title!,
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
                    '${mangaDetails.score}/10',
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
