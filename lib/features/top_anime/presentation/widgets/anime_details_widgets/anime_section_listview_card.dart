import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/global_widgets/image_with_shimmer.dart';
import '../../../../../core/navigation/custom_navigation.dart';
import '../../../../../core/navigation/routes.dart';
import '../../../data/models/classes/anime_data.dart';

class AnimeSectionListViewCard extends StatelessWidget {
  const AnimeSectionListViewCard({
    super.key,
    required this.animeDetails,
  });
  final AnimeData animeDetails;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: 32.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              CustomNavigator.push(Routes.animeDetails,
                  arguments: animeDetails);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ImageWithShimmer(
                imageUrl: animeDetails.images!.jpg!.largeImageUrl.toString(),
                width: double.infinity,
                height: 22.h,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                animeDetails.titleEnglish ?? animeDetails.title!,
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
