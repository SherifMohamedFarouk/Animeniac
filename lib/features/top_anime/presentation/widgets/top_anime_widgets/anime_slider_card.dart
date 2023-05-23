import 'package:flutter/material.dart';

import '../../../../../core/color/colors.dart';
import '../../../../../core/navigation/custom_navigation.dart';
import '../../../../../core/navigation/routes.dart';
import '../../../data/models/classes/anime_data.dart';
import 'anime_slider_card_image.dart';

class AnimeSliderCard extends StatelessWidget {
  const AnimeSliderCard({
    super.key,
    required this.animeData,
    required this.itemIndex,
  });

  final AnimeData animeData;

  final int itemIndex;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        CustomNavigator.push(Routes.animeDetails, arguments: animeData);
      },
      child: SafeArea(
        child: Stack(
          children: [
            AnimeSliderCardImage(
                imageUrl: animeData.images!.jpg!.largeImageUrl ??
                    animeData.images!.jpg!.imageUrl!),
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
                      animeData.titleEnglish ?? animeData.title!,
                      maxLines: 2,
                      style: textTheme.titleMedium,
                    ),
                    Text(
                      animeData.year != null ? animeData.year.toString() : '',
                      style: textTheme.bodyLarge,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 20,
                        ),
                        Text(
                          animeData.score.toString(),
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
                          (indexD) {
                            return Container(
                              margin: const EdgeInsets.only(right: 10),
                              width: indexD == itemIndex ? 30 : 6,
                              height: 6,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: indexD == itemIndex
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
