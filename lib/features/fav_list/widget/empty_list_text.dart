import 'package:flutter/material.dart';

class EmptylistText extends StatelessWidget {
  const EmptylistText({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Your List Is Empty',
          style: textTheme.titleMedium,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Center(
            child: Text(
              'After adding items to your list, they will appear here.',
              style: textTheme.bodyLarge,
            ),
          ),
        ),
      ],
    );
  }
}
