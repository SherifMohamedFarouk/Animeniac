import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/color/colors.dart';
import '../../search_bloc/anime_search_bloc/anime_search_bloc.dart';

class AnimeSearchBar extends StatefulWidget {
  const AnimeSearchBar({
    super.key,
  });

  @override
  State<AnimeSearchBar> createState() => _AnimeSearchBarState();
}

class _AnimeSearchBarState extends State<AnimeSearchBar> {
  final _textController = TextEditingController();
  Timer? searchOnStoppedTyping;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        controller: _textController,
        cursorWidth: 1,
        onChanged: _onChangeHandler,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(),
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(),
            borderRadius: BorderRadius.circular(8),
          ),
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: primaryColor,
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              _textController.text = '';
              context
                  .read<AnimeSearchBloc>()
                  .add(const GetAnimeSearchEvent(''));
            },
            child: const Icon(
              Icons.clear_rounded,
              color: primaryColor,
            ),
          ),
          hintText: 'Search for Anime...',
        ),
      ),
    );
  }

  _onChangeHandler(search) {
    const duration = Duration(
        milliseconds:
            800); // set the duration that you want call search() after that.
    if (searchOnStoppedTyping != null) {
      setState(() => searchOnStoppedTyping!.cancel()); // clear timer
    }
    setState(() => searchOnStoppedTyping = Timer(duration, () {
          //input code here
          context.read<AnimeSearchBloc>().add(GetAnimeSearchEvent(search));
        }));
  }
}
