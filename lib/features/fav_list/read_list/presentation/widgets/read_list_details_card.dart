import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/color/colors.dart';
import '../../../../top_manga/presentation/widgets/manga_details_widgets/manga_slider_card_image.dart';
import '../../data/models/read_list_model.dart';

class ReadListDetailsCard extends StatefulWidget {
  const ReadListDetailsCard({
    required this.detailsWidget,
    super.key,
    required this.readListDetails,
  });

  final Widget detailsWidget;
  final ReadListModel readListDetails;

  @override
  State<ReadListDetailsCard> createState() => _ReadListDetailsCardState();
}

class _ReadListDetailsCardState extends State<ReadListDetailsCard> {
  bool isFav = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Stack(
        children: [
          MangaSliderCardImage(imageUrl: widget.readListDetails.largeImage!),
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
                            widget.readListDetails.title ?? 'no title',
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
                                'Status : ${widget.readListDetails.status} ',
                                style: textTheme.bodyMedium,
                              ),
                              if (widget.readListDetails.rank != null) ...[
                                Text(
                                  'Rank : ${widget.readListDetails.rank!.toString()} ,',
                                  style: textTheme.bodySmall,
                                ),
                              ],
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (widget.readListDetails.url != null) ...[
                      InkWell(
                        onTap: () async {
                          final urlR = Uri.parse(widget.readListDetails.url!);
                          if (!await launchUrl(urlR)) {
                            throw Exception('Could not launch $urlR');
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
        ],
      ),
    );
  }
}
