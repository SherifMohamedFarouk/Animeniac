import 'package:flutter/material.dart';

class EmptyWatchlistText extends StatelessWidget {
  const EmptyWatchlistText({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Watchlist Is Empty',
          style: textTheme.titleMedium,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Center(
            child: Text(
              'After adding animes to watchlist, they will appear here.',
              style: textTheme.bodyLarge,
            ),
          ),
        ),
      ],
    );
  }
}
