import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/global_widgets/loading_widget.dart';
import '../../../../core/global_widgets/lottie_animations/naruto_loader.dart';
import '../../../../core/global_widgets/message_display_widget.dart';
import '../../../../injection_container.dart';
import '../search_bloc/bloc/anime_search_bloc.dart';
import '../widgets/search_bar.dart';
import '../widgets/search_grid_view.dart';
import '../widgets/search_text.dart';

class AnimeSearchView extends StatelessWidget {
  const AnimeSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AnimeSearchBloc>(),
      child: const SearchWidget(),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(
              top: 12,
              left: 16,
              right: 16,
            ),
            child: Column(
              children: [
                const SearchBar(),
                BlocBuilder<AnimeSearchBloc, AnimeSearchState>(
                  builder: (context, state) {
                    if (state is LoadingAnimeSearchState) {
                      return const ProcessingOverLay();
                    } else if (state is LoadedAnimeSearchState) {
                      return SearchGridView(results: state.search);
                    } else if (state is ErrorAnimeSearchState) {
                      return MessageDisplayWidget(message: state.message);
                    }
                    return const SearchText();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
