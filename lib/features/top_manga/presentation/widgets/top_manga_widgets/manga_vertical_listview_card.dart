import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/global_widgets/image_with_shimmer.dart';
import '../../../../../core/navigation/custom_navigation.dart';
import '../../../../../core/navigation/routes.dart';
import '../../../data/models/classes/manga_data.dart';

class MangaVerticalListViewCard extends StatelessWidget {
  const MangaVerticalListViewCard({
    super.key,
    required this.mangaData,
  });

  final MangaData mangaData;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        CustomNavigator.push(Routes.mangaDetails, arguments: mangaData);
      },
      child: Container(
        height: 22.h,
        decoration: BoxDecoration(
          // color: AppColors.secondaryBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: ImageWithShimmer(
                  imageUrl: mangaData.images!.jpg!.imageUrl ??
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
                  width: 32.w,
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
                      mangaData.titleEnglish ?? mangaData.title!,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.titleSmall,
                    ),
                  ),
                  Row(
                    children: [
                      mangaData.published!.prop!.from!.year != null
                          ? Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Text(
                                mangaData.published!.prop!.from!.year
                                    .toString(),
                                textAlign: TextAlign.center,
                                style: textTheme.bodyLarge,
                              ),
                            )
                          : const SizedBox.shrink(),
                      const Icon(
                        Icons.star_rate_rounded,
                        color: Colors.amber,
                        size: 18,
                      ),
                      Text(
                        mangaData.score.toString(),
                        style: textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  mangaData.chapters != null
                      ? Padding(
                          padding: const EdgeInsets.only(top: 14),
                          child: Text(
                            'Chapters: ${mangaData.chapters.toString()}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.bodyLarge,
                          ),
                        )
                      : const SizedBox.shrink(),
                  mangaData.volumes != null
                      ? Padding(
                          padding: const EdgeInsets.only(top: 14),
                          child: Text(
                            'Volumes: ${mangaData.volumes.toString()}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.bodyLarge,
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
