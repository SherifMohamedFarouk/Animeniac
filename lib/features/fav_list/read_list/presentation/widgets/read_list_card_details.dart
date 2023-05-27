import '../../data/models/read_list_model.dart';
import 'package:flutter/material.dart';

class ReadListCardDetails extends StatelessWidget {
  const ReadListCardDetails({
    super.key,
    required this.readListDetails,
  });
  final ReadListModel readListDetails;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    if (readListDetails.chapters != null &&
        readListDetails.releaseDate != null &&
        readListDetails.score != null) {
      return Row(
        children: [
          if (readListDetails.chapters != null) ...[
            Text(
              'Episodes : ${readListDetails.chapters!.toString()} ,',
              style: textTheme.bodyLarge,
            ),
          ],
          if (readListDetails.releaseDate != null) ...[
            Text(
              'Year : ${readListDetails.releaseDate.toString()} ,',
              style: textTheme.bodyLarge,
            ),
          ] else ...[
            if (readListDetails.score != null) ...[]
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
            readListDetails.score!.toString(),
            style: textTheme.bodyLarge,
          ),
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}
