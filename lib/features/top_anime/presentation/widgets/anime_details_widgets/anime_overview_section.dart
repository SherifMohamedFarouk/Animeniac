import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../core/color/colors.dart';

class AnimeOverviewSection extends StatelessWidget {
  final String overview;

  const AnimeOverviewSection({
    super.key,
    required this.overview,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ReadMoreText(
        overview,
        trimLines: 5,
        trimMode: TrimMode.Line,
        trimCollapsedText: 'showMore',
        trimExpandedText: 'showLess',
        style: Theme.of(context).textTheme.bodyLarge,
        moreStyle: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontWeight: FontWeight.w600, color: primaryColor),
        lessStyle: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontWeight: FontWeight.w600, color: primaryColor),
      ),
    );
  }
}
