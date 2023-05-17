import 'package:flutter/material.dart';

class SearchText extends StatelessWidget {
  const SearchText({
    super.key,
    required this.isAnime,
  });

  final bool isAnime;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Search',
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: isAnime
                ? const Text(
                    'By typing in search bar, Anime search in Animeniac and then show you the best results.',
                    textAlign: TextAlign.center,
                  )
                : const Text(
                    'By typing in search bar, Manga search in Animeniac and then show you the best results.',
                    textAlign: TextAlign.center,
                  ),
          ),
        ],
      ),
    );
  }
}
