import 'package:animeniac/core/color/colors.dart';
import 'package:animeniac/core/widgets/slider_card_image.dart';
import 'package:animeniac/features/top_anime/data/models/classes/data.dart';
import 'package:animeniac/features/top_anime/data/models/top_anime_model.dart';
import 'package:flutter/material.dart';

class SliderCard extends StatelessWidget {
  const SliderCard({
    super.key,
    required this.myData,
    required this.itemIndex,
  });

  final Data myData;
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
            SliderCardImage(
                imageUrl: myData.images!.jpg!.largeImageUrl ??
                    myData.images!.jpg!.imageUrl!),
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
                      myData.titleEnglish!,
                      maxLines: 2,
                      style: textTheme.titleMedium,
                    ),
                    Text(
                      myData.year.toString(),
                      style: textTheme.bodyLarge,
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
