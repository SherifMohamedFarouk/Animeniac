import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final Function() onSeeAllTap;

  const SectionHeader({
    super.key,
    required this.title,
    required this.onSeeAllTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: textTheme.titleSmall,
          ),
          InkWell(
            onTap: onSeeAllTap,
            child: Row(
              children: [
                Text(
                  'seeAll',
                  style: textTheme.bodyLarge,
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 12,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
