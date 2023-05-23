import '../../../auth/presentation/widgets/auth_widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/global_widgets/lottie_animations/naruto_loader.dart';
import '../../../../core/global_widgets/message_display_widget.dart';
import '../../../../injection_container.dart';

import '../search_bloc/anime_search_bloc/anime_search_bloc.dart';
import '../search_bloc/manga_search_bloc/manga_search_bloc.dart';

import '../widgets/anime_widgets/anime_search_bar.dart';
import '../widgets/anime_widgets/anime_search_grid_view.dart';
import '../widgets/manga_widgets/manga_search_bar.dart';
import '../widgets/manga_widgets/manga_search_grid_view.dart';
import '../widgets/search_text.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AnimeSearchBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<MangaSearchBloc>(),
        ),
      ],
      child: const SearchWidget(),
    );
  }
}

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  bool isAnime = false;

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
                Button(
                    label: isAnime ? "Switch To Manga" : "Switch To Anime",
                    action: () {
                      setState(() {
                        isAnime = !isAnime;
                      });
                    },
                    padding: const EdgeInsets.all(0)),
                SizedBox(
                  height: 1.h,
                ),
                isAnime ? const AnimeSearchBar() : const MangaSearchBar(),
                isAnime
                    ? BlocBuilder<AnimeSearchBloc, AnimeSearchState>(
                        builder: (context, state) {
                          if (state is LoadingAnimeSearchState) {
                            return const ProcessingOverLay();
                          } else if (state is LoadedAnimeSearchState) {
                            return AnimeSearchGridView(
                              animeResults: state.search,
                              isAnime: isAnime,
                            );
                          } else if (state is ErrorAnimeSearchState) {
                            return MessageDisplayWidget(message: state.message);
                          }
                          return SearchText(isAnime: isAnime);
                        },
                      )
                    : BlocBuilder<MangaSearchBloc, MangaSearchState>(
                        builder: (context, state) {
                          if (state is LoadingMangaSearchState) {
                            return const ProcessingOverLay();
                          } else if (state is LoadedMangaSearchState) {
                            return MangaSearchGridView(
                              mangaResults: state.search,
                              isAnime: isAnime,
                            );
                          } else if (state is ErrorMangaSearchState) {
                            return MessageDisplayWidget(message: state.message);
                          }
                          return SearchText(isAnime: isAnime);
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
