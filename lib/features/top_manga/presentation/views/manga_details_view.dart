import 'package:flutter/material.dart';

import '../../../../core/global_widgets/top_bar.dart';
import '../../data/models/classes/manga_data.dart';
import '../widgets/manga_details_widgets/manga_card_details.dart';
import '../widgets/manga_details_widgets/manga_details_card.dart';
import '../widgets/manga_details_widgets/manga_overview_section.dart';
import '../widgets/manga_details_widgets/manga_section_title.dart';

class MangaDetailsView extends StatelessWidget {
  const MangaDetailsView({
    super.key,
    required this.mangaDetails,
  });
  final MangaData mangaDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const TopBar(
          title: 'assets/images/anime3.png',
          page: 'Manga',
        ),
        body: MangaDetailsWidget(
          mangaDetails: mangaDetails,
        ));
  }
}

class MangaDetailsWidget extends StatelessWidget {
  const MangaDetailsWidget({
    super.key,
    required this.mangaDetails,
  });
  final MangaData mangaDetails;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MangaDetailsCard(
            mangaDetails: mangaDetails,
            detailsWidget: MangaCardDetails(
              mangaDetails: mangaDetails,
            ),
          ),
          getOverviewSection(mangaDetails.synopsis.toString()),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget getOverviewSection(String overview) {
    if (overview.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MangaSectionTitle(title: 'Story'),
          MangaOverviewSection(overview: overview),
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
