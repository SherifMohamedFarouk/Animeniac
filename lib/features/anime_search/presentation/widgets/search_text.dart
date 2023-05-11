import 'package:flutter/material.dart';

class SearchText extends StatelessWidget {
  const SearchText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Search',
          ),
          Padding(
            padding: EdgeInsets.only(top: 6),
            child: Text(
              'By typing in search bar, Anime search in Animeniac and then show you the best results.',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
