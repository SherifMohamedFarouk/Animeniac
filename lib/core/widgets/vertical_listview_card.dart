import 'package:animeniac/core/color/colors.dart';
import 'package:animeniac/features/top_anime/data/models/classes/data.dart';
import 'package:animeniac/features/top_anime/data/models/classes/image_url.dart';
import 'package:animeniac/features/top_anime/data/models/top_anime_model.dart';
import 'package:flutter/material.dart';

import 'image_with_shimmer.dart';

class VerticalListViewCard extends StatelessWidget {
  const VerticalListViewCard({
    super.key,
    required this.myData,
  });

  final Data myData;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        // navigateToDetailsView(context, media);
      },
      child: Container(
        height: 175,
        decoration: BoxDecoration(
          // color: AppColors.secondaryBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: ImageWithShimmer(
                  imageUrl: myData.images!.jpg!.imageUrl ??
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
                  width: 110,
                  height: double.infinity,
                ),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Text(
                      myData.titleEnglish!,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.titleSmall,
                    ),
                  ),
                  Row(
                    children: [
                      myData.year != null
                          ? Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Text(
                                myData.year.toString(),
                                textAlign: TextAlign.center,
                                style: textTheme.bodyLarge,
                              ),
                            )
                          : SizedBox.shrink(),
                      const Icon(
                        Icons.star_rate_rounded,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      Text(
                        myData.score.toString(),
                        style: textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: Text(
                      myData.rating.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
