import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/global_widgets/loading_indicator.dart';
import '../../../../core/global_widgets/loading_widget.dart';
import '../../../../core/global_widgets/message_display_widget.dart';
import '../../../../injection_container.dart';
import '../../data/models/top_anime_model.dart';
import '../anime_bloc/animes_bloc.dart';
import '../widgets/anime_custom_slider.dart';
import '../widgets/anime_slider_card.dart';
import '../widgets/anime_vertical_listview.dart';
import '../widgets/anime_vertical_listview_card.dart';

class TopAnimeView extends StatelessWidget {
  const TopAnimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AnimesBloc>()..add(GetTopAnimesEvent()),
      child: Scaffold(
        // appBar: const TopBar(title: 's'),
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
                AnimeVerticalListView(
                  itemCount: animes.data!.length + 1,
                  itemBuilder: (context, index) {
                    if (index < 5) {
                      return SizedBox.shrink();
                    } else {
                      if (index < animes.data!.length) {
                        return AnimeVerticalListViewCard(
                          animeData: animes.data![index],
                        );
                      } else {
                        return const LoadingIndicator();
                      }
                    }
                  },
                  addEvent: () {
                    context.read<AnimesBloc>().add(FetchMoreAnimeEvent());
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
