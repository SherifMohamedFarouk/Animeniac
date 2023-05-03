import 'dart:math';

import 'package:animeniac/features/top_anime/data/models/classes/image_url.dart';
import 'package:animeniac/features/top_anime/data/models/top_anime_model.dart';
import 'package:animeniac/features/top_anime/presentation/anime/animes_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_slider.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/message_display_widget.dart';
import '../../../../core/widgets/slider_card.dart';
import '../../../../core/widgets/top_bar.dart';
import '../../../../core/widgets/vertical_listview.dart';
import '../../../../core/widgets/vertical_listview_card.dart';
import '../../../../injection_container.dart';

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
              return LoadingWidget();
            } else if (state is LoadedAnimeState) {
              return RefreshIndicator(
                  onRefresh: () => _onRefresh(context),
                  child: TopAnimeWidget(animes: state.animes));
            } else if (state is ErrorAnimesState) {
              return MessageDisplayWidget(message: state.message);
            }
            return LoadingWidget();
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
        return SingleChildScrollView(
          child: Column(
            children: [
              CustomSlider(
                itemBuilder: (context, itemIndex, _) {
                  return SliderCard(
                    myData: animes.data![itemIndex],
                    itemIndex: itemIndex,
                  );
                },
              ),
              VerticalListView(
                itemCount: animes.data!.length + 1,
                itemBuilder: (context, index) {
                  if (index < 4) {
                    return SizedBox.shrink();
                  } else {
                    if (index < animes.data!.length) {
                      return VerticalListViewCard(
                        myData: animes.data![index],
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
        );
      },
    );
  }
}
