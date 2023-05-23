import 'package:sizer/sizer.dart';

import '../../../../core/navigation/custom_navigation.dart';
import '../../../../core/navigation/routes.dart';
import '../widgets/anime_details_widgets/anime_section_header.dart';
import '../widgets/anime_details_widgets/anime_section_listview.dart';
import '../widgets/anime_details_widgets/anime_section_listview_card.dart';
import 'top_anime_imports.dart';

class TopAnimeView extends StatelessWidget {
  const TopAnimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AnimesBloc>()..add(GetTopAnimesEvent()),
      child: Scaffold(
        appBar: const TopBar(
          title: 'assets/images/Animeniac.png',
          page: 'Anime',
        ),
        body: BlocBuilder<AnimesBloc, AnimeState>(
          builder: (context, state) {
            if (state is LoadingAnimeState) {
              return const LoadingWidget();
            } else if (state is LoadedAnimeState) {
              return RefreshIndicator(
                  onRefresh: () => _onRefresh(context),
                  child: TopAnimeWidget(animes: state.animes));
            } else if (state is ErrorAnimesState) {
              return MessageDisplayWidget(message: state.message);
            }
            return const LoadingWidget();
          },
        ),
      ),
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<AnimesBloc>(context).add(RefreshAnimesEvent());
  }
}

class TopAnimeWidget extends StatelessWidget {
  const TopAnimeWidget({
    required this.animes,
    super.key,
  });

  final TopAnimeModel animes;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimesBloc, AnimeState>(
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                AnimeCustomSlider(
                  itemBuilder: (context, itemIndex, _) {
                    return AnimeSliderCard(
                      animeData: animes.data![itemIndex],
                      itemIndex: itemIndex,
                    );
                  },
                ),
                AnimeSectionHeader(
                  title: 'Top Animes',
                  onSeeAllTap: () {
                    CustomNavigator.push(Routes.allTopAnimes);
                  },
                ),
                AnimeSectionListView(
                  height: 32.h,
                  itemCount: animes.data!.length,
                  itemBuilder: (context, index) {
                    if (index < 5) {
                      return const SizedBox.shrink();
                    } else {
                      return AnimeSectionListViewCard(
                          animeDetails: animes.data![index]);
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
