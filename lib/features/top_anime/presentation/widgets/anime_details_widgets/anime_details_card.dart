import '../../../../../core/color/colors.dart';
import '../../../data/models/classes/anime_data.dart';

import '../../views/top_anime_imports.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import 'anime_slider_card_image.dart';

class AnimeDetailsCard extends StatelessWidget {
  const AnimeDetailsCard({
    required this.detailsWidget,
    super.key,
    required this.animeDetails,
  });

  final Widget detailsWidget;
  final AnimeData animeDetails;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Stack(
        children: [
          AnimeSliderCardImage(
              imageUrl: animeDetails.images!.jpg!.largeImageUrl!),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: size.height * 0.6,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            animeDetails.titleEnglish!,
                            maxLines: 2,
                            style: textTheme.titleMedium,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 4,
                              bottom: 6,
                            ),
                            child: detailsWidget,
                          ),
                          Row(
                            children: [
                              Text(
                                'Rating : ${animeDetails.rating} ',
                                style: textTheme.bodyMedium,
                              ),
                              Text(
                                'Rank : ${animeDetails.rank!.toString()}',
                                style: textTheme.bodySmall,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (animeDetails.trailer!.url != null) ...[
                      InkWell(
                        onTap: () async {
                          final url = Uri.parse(animeDetails.trailer!.url!);
                          if (!await launchUrl(url)) {
                            throw Exception('Could not launch $url');
                          }
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            color: primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.play_arrow_rounded,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 12,
              left: 16,
              right: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 20,
                    ),
                  ),
                ),
                // InkWell(
                //   onTap: () {
                //     animeDetails.isAdded
                //         ? context
                //             .read<WatchlistBloc>()
                //             .add(RemoveWatchListItemEvent(animeDetails.id!))
                //         : context.read<WatchlistBloc>().add(
                //               AddWatchListItemEvent(
                //                   media: Media.fromMediaDetails(animeDetails)),
                //             );
                //   },
                //   child: Container(
                //     padding: const EdgeInsets.all(8),
                //     decoration: const BoxDecoration(
                //       shape: BoxShape.circle,
                //     ),
                //     child: BlocConsumer<WatchlistBloc, WatchlistState>(
                //       listener: (context, state) {
                //         if (state.status == WatchlistRequestStatus.itemAdded) {
                //           animeDetails.id = state.id;
                //           animeDetails.isAdded = true;
                //         } else if (state.status ==
                //             WatchlistRequestStatus.itemRemoved) {
                //           animeDetails.id = null;
                //           animeDetails.isAdded = false;
                //         } else if (state.status ==
                //                 WatchlistRequestStatus.isItemAdded &&
                //             state.id != -1) {
                //           animeDetails.id = state.id;
                //           animeDetails.isAdded = true;
                //         }
                //       },
                //       builder: (context, state) {
                //         return Icon(
                //           Icons.bookmark_rounded,
                //           color: animeDetails.isAdded
                //               ? AppColors.primary
                //               : AppColors.secondaryText,
                //           size: AppSize.s20,
                //         );
                //       },
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
