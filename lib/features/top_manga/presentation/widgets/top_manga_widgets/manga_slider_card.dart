import 'package:flutter/material.dart';

import '../../../../../core/color/colors.dart';
import '../../../../../core/navigation/custom_navigation.dart';
import '../../../../../core/navigation/routes.dart';
import '../../../data/models/classes/manga_data.dart';
import 'manga_slider_card_image.dart';

class MangaSliderCard extends StatelessWidget {
  const MangaSliderCard({
    super.key,
    required this.mangaData,
    required this.itemIndex,
  });

  final MangaData mangaData;
  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        CustomNavigator.push(Routes.MANGA_DETAILS, arguments: mangaData);
      },
      child: SafeArea(
        child: Stack(
          children: [
            MangaSliderCardImage(
              imageUrl: mangaData.images!.jpg!.largeImageUrl ??
                  mangaData.images!.jpg!.imageUrl ??
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png',
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 16,
                left: 16,
                bottom: 10,
              ),
              child: SizedBox(
                height: size.height * 0.55,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mangaData.titleEnglish ?? mangaData.title!,
                      maxLines: 2,
                      style: textTheme.titleMedium,
                    ),
                    Text(
                      mangaData.published!.prop!.from!.year.toString(),
                      style: textTheme.bodyLarge,
                    ),
                    Text(
                      'Status : ${mangaData.status} ,',
                      style: textTheme.bodyMedium,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 20,
                        ),
                        Text(
                          mangaData.score.toString(),
                          style: textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(
                          5,
                          (indexDot) {
                            return Container(
                              margin: const EdgeInsets.only(right: 10),
                              width: indexDot == itemIndex ? 30 : 6,
                              height: 6,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: indexDot == itemIndex
                                    ? primaryColor
                                    : secondaryColor,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
