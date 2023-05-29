import 'package:flutter/material.dart';

import '../../../../core/global_widgets/top_bar.dart';
import '../../data/models/classes/anime_data.dart';
import '../widgets/anime_details_widgets/anime_card_details.dart';
import '../widgets/anime_details_widgets/anime_details_card.dart';
import '../widgets/anime_details_widgets/anime_overview_section.dart';
import '../widgets/anime_details_widgets/anime_section_title.dart';

class AnimeDetailsView extends StatelessWidget {
  const AnimeDetailsView({
    super.key,
    required this.animeDetails,
  });
  final AnimeData animeDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const TopBar(
          title: 'assets/images/anime3.png',
          page: 'Anime',
        ),
        body: AnimeDetailsWidget(
          animeDetails: animeDetails,
        ));
  }
}

class AnimeDetailsWidget extends StatelessWidget {
  const AnimeDetailsWidget({
    super.key,
    required this.animeDetails,
  });
  final AnimeData animeDetails;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimeDetailsCard(
            animeDetails: animeDetails,
            detailsWidget: AnimeCardDetails(
              animeDetails: animeDetails,
            ),
          ),
          getOverviewSection(animeDetails.synopsis.toString()),
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
          const AnimeSectionTitle(title: 'Story'),
          AnimeOverviewSection(overview: overview),
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
