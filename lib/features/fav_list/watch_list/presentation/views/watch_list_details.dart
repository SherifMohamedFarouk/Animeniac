import 'package:flutter/material.dart';

import '../../../../../core/global_widgets/top_bar.dart';
import '../../../../top_anime/presentation/widgets/anime_details_widgets/anime_overview_section.dart';
import '../../../../top_anime/presentation/widgets/anime_details_widgets/anime_section_title.dart';
import '../../data/models/watch_list_model.dart';
import '../widgets/watch_list_card_details.dart';
import '../widgets/watch_list_details_card.dart';

class WatchListDetailsView extends StatelessWidget {
  const WatchListDetailsView({
    super.key,
    required this.watchListDetails,
  });
  final WatchListModel watchListDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const TopBar(
          title: 'assets/images/anime3.png',
          page: 'Anime',
        ),
        body: WatchListDetailsWidget(
          watchListDetails: watchListDetails,
        ));
  }
}

class WatchListDetailsWidget extends StatelessWidget {
  const WatchListDetailsWidget({
    super.key,
    required this.watchListDetails,
  });
  final WatchListModel watchListDetails;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WatchListDetailsCard(
            watchListDetails: watchListDetails,
            detailsWidget: WatchListCardDetails(
              watchListDetails: watchListDetails,
            ),
          ),
          getOverviewSection(watchListDetails.description.toString()),
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
