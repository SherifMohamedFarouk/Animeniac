import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/global_widgets/loading_indicator.dart';
import '../../../../core/global_widgets/loading_widget.dart';
import '../../../../core/global_widgets/message_display_widget.dart';

import '../../../../injection_container.dart';
import '../../data/models/top_manga_model.dart';
import '../manga_bloc/mangas_bloc.dart';
import '../widgets/manga_custom_slider.dart';
import '../widgets/manga_slider_card.dart';
import '../widgets/manga_vertical_listview.dart';
import '../widgets/manga_vertical_listview_card.dart';

class TopMangaView extends StatelessWidget {
  const TopMangaView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MangasBloc>()..add(GetTopMangasEvent()),
      child: Scaffold(
        // appBar: const TopBar(title: 's'),
        body: BlocBuilder<MangasBloc, MangaState>(
          builder: (context, state) {
            if (state is LoadingMangaState) {
              return const LoadingWidget();
            } else if (state is LoadedMangaState) {
              return RefreshIndicator(
                  onRefresh: () => _onRefresh(context),
                  child: TopMangaWidget(mangas: state.mangas));
            } else if (state is ErrorMangasState) {
              return MessageDisplayWidget(message: state.message);
            }
            return const LoadingWidget();
          },
        ),
      ),
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<MangasBloc>(context).add(RefreshMangasEvent());
  }
}

class TopMangaWidget extends StatelessWidget {
  const TopMangaWidget({
    required this.mangas,
    super.key,
  });

  final TopMangaModel mangas;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MangasBloc, MangaState>(
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                MangaCustomSlider(
                  itemBuilder: (context, itemIndex, _) {
                    return MangaSliderCard(
                      mangaData: mangas.data![itemIndex],
                      itemIndex: itemIndex,
                    );
                  },
                ),
                MangaVerticalListView(
                  itemCount: mangas.data!.length + 1,
                  itemBuilder: (context, index) {
                    if (index < 5) {
                      return const SizedBox.shrink();
                    } else {
                      if (index < mangas.data!.length) {
                        return MangaVerticalListViewCard(
                          mangaData: mangas.data![index],
                        );
                      } else {
                        return const LoadingIndicator();
                      }
                    }
                  },
                  addEvent: () {
                    context.read<MangasBloc>().add(FetchMoreMangaEvent());
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
