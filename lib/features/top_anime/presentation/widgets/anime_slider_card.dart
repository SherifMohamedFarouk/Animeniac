import 'package:animeniac/core/color/colors.dart';
import 'package:animeniac/features/top_anime/data/models/classes/anime_data.dart';

import 'package:flutter/material.dart';

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
        // navigateToDetailsView(context, media);
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
                      animeData.titleEnglish!,
                      maxLines: 2,
                      style: textTheme.titleMedium,
                    ),
                    Text(
                      animeData.year.toString(),
                      style: textTheme.bodyLarge,
                    ),
                    Row(
                      children: [
                        Icon(
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
