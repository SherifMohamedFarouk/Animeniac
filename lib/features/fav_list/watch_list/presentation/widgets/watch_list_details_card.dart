import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/color/colors.dart';
import '../../../../top_anime/presentation/widgets/anime_details_widgets/anime_slider_card_image.dart';
import '../../data/models/watch_list_model.dart';

class WatchListDetailsCard extends StatefulWidget {
  const WatchListDetailsCard({
    required this.detailsWidget,
    super.key,
    required this.watchListDetails,
  });

  final Widget detailsWidget;
  final WatchListModel watchListDetails;

  @override
  State<WatchListDetailsCard> createState() => _WatchListDetailsCardState();
}

class _WatchListDetailsCardState extends State<WatchListDetailsCard> {
  bool isFav = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Stack(
        children: [
          AnimeSliderCardImage(imageUrl: widget.watchListDetails.largeImage!),
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
                            widget.watchListDetails.title ?? 'no title',
                            maxLines: 2,
                            style: textTheme.titleMedium,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 4,
                              bottom: 6,
                            ),
                            child: widget.detailsWidget,
                          ),
                          Row(
                            children: [
                              Text(
                                'Rating : ${widget.watchListDetails.rating} ',
                                style: textTheme.bodyMedium,
                              ),
                              if (widget.watchListDetails.rank != null) ...[
                                Text(
                                  'Rank : ${widget.watchListDetails.rank!.toString()} ,',
                                  style: textTheme.bodySmall,
                                ),
                              ],
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (widget.watchListDetails.trailer != null) ...[
                      InkWell(
                        onTap: () async {
                          final url =
                              Uri.parse(widget.watchListDetails.trailer!);
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
        ],
      ),
    );
  }
}
