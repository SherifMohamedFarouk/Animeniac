import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/global_widgets/image_with_shimmer.dart';
import '../../../../../core/navigation/custom_navigation.dart';
import '../../../../../core/navigation/routes.dart';
import '../../../../top_manga/data/models/classes/manga_data.dart';

class MangaGridViewCard extends StatelessWidget {
  const MangaGridViewCard({super.key, required this.mangaItem});

  final MangaData mangaItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            CustomNavigator.push(Routes.mangaDetails, arguments: mangaItem);
          },
          child: AspectRatio(
            aspectRatio: 2 / 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ImageWithShimmer(
                imageUrl: mangaItem.images!.jpg!.imageUrl ??
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
                width: double.infinity,
                height: 10.h,
              ),
            ),
          ),
        ),
        Expanded(
          child: Text(
            mangaItem.titleEnglish ?? mangaItem.title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
