import 'package:flutter/material.dart';

import '../../../../../core/global_widgets/top_bar.dart';
import '../../../../top_manga/presentation/widgets/manga_details_widgets/manga_overview_section.dart';
import '../../../../top_manga/presentation/widgets/manga_details_widgets/manga_section_title.dart';
import '../../data/models/read_list_model.dart';
import '../widgets/read_list_card_details.dart';
import '../widgets/read_list_details_card.dart';

class ReadListDetailsView extends StatelessWidget {
  const ReadListDetailsView({
    super.key,
    required this.readListDetails,
  });
  final ReadListModel readListDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const TopBar(
          title: 'assets/images/Animeniac.png',
          page: 'Manga',
        ),
        body: ReadListDetailsWidget(
          readListDetails: readListDetails,
        ));
  }
}

class ReadListDetailsWidget extends StatelessWidget {
  const ReadListDetailsWidget({
    super.key,
    required this.readListDetails,
  });
  final ReadListModel readListDetails;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReadListDetailsCard(
            readListDetails: readListDetails,
            detailsWidget: ReadListCardDetails(
              readListDetails: readListDetails,
            ),
          ),
          getOverviewSection(readListDetails.description.toString()),
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
