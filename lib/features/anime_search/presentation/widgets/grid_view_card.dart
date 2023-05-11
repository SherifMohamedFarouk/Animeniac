import '../../../../core/navigation/custom_navigation.dart';

import 'package:flutter/material.dart';

import '../../../../core/global_widgets/image_with_shimmer.dart';
import '../../../../core/navigation/routes.dart';
import '../../../top_anime/data/models/classes/anime_data.dart';

class GridViewCard extends StatelessWidget {
  const GridViewCard({
    super.key,
    required this.item,
  });

  final AnimeData item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            CustomNavigator.push(Routes.ANIME_DETAILS, arguments: item);
          },
          child: AspectRatio(
            aspectRatio: 2 / 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ImageWithShimmer(
                imageUrl: item.images!.jpg!.imageUrl ??
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
                width: double.infinity,
                height: 150,
              ),
            ),
          ),
        ),
        Expanded(
          child: Text(
            item.titleEnglish ?? item.title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
