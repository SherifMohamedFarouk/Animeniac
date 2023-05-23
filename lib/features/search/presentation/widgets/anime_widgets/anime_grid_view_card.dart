import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/global_widgets/image_with_shimmer.dart';
import '../../../../../core/navigation/custom_navigation.dart';
import '../../../../../core/navigation/routes.dart';
import '../../../../top_anime/data/models/classes/anime_data.dart';

class AnimeGridViewCard extends StatelessWidget {
  const AnimeGridViewCard({super.key, required this.animeItem});

  final AnimeData animeItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            CustomNavigator.push(Routes.animeDetails, arguments: animeItem);
          },
          child: AspectRatio(
            aspectRatio: 2 / 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ImageWithShimmer(
                imageUrl: animeItem.images!.jpg!.imageUrl ??
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
                width: double.infinity,
                height: 10.h,
              ),
            ),
          ),
        ),
        Expanded(
          child: Text(
            animeItem.titleEnglish ?? animeItem.title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
