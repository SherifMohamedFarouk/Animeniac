import 'package:flutter/material.dart';

import '../../data/models/watch_list_model.dart';

class WatchListCardDetails extends StatelessWidget {
  const WatchListCardDetails({
    super.key,
    required this.watchListDetails,
  });
  final WatchListModel watchListDetails;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    if (watchListDetails.episodes != null &&
        watchListDetails.releaseDate != null &&
        watchListDetails.score != null) {
      return Row(
        children: [
          if (watchListDetails.episodes != null) ...[
            Text(
              'Episodes : ${watchListDetails.episodes!.toString()} ,',
              style: textTheme.bodyLarge,
            ),
          ],
          if (watchListDetails.releaseDate != null) ...[
            Text(
              'Year : ${watchListDetails.releaseDate.toString()} ,',
              style: textTheme.bodyLarge,
            ),
          ] else ...[
            if (watchListDetails.score != null) ...[]
          ],
          Text(
            'Score:',
            style: textTheme.bodyLarge,
          ),
          const Icon(
            Icons.star_rate_rounded,
            color: Colors.amber,
            size: 18,
          ),
          Text(
            watchListDetails.score!.toString(),
            style: textTheme.bodyLarge,
          ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
