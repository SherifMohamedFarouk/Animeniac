import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/color/colors.dart';
import '../../../data/models/classes/manga_data.dart';
import '../top_manga_widgets/manga_slider_card_image.dart';

class MangaDetailsCard extends StatelessWidget {
  const MangaDetailsCard({
    required this.detailsWidget,
    super.key,
    required this.mangaDetails,
  });

  final Widget detailsWidget;
  final MangaData mangaDetails;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Stack(
        children: [
          MangaSliderCardImage(
              imageUrl: mangaDetails.images!.jpg!.largeImageUrl!),
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
                            mangaDetails.titleEnglish ?? mangaDetails.title!,
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
                                'Status : ${mangaDetails.status} ,',
                                style: textTheme.bodyMedium,
                              ),
                              Text(
                                'Rank : ${mangaDetails.rank!.toString()}',
                                style: textTheme.bodySmall,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (mangaDetails.url != null) ...[
                      InkWell(
                        onTap: () async {
                          final url = Uri.parse(mangaDetails.url!);
                          if (!await launchUrl(url)) {
                            throw Exception('Could not launch $url');
                          }
                        },
                        child: Container(
                          height: 10.h,
                          width: 10.w,
                          decoration: const BoxDecoration(
                            color: primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.menu_book_sharp,
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
