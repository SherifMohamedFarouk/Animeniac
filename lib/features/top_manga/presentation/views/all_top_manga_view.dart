import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/global_widgets/loading_indicator.dart';
import '../../../../core/global_widgets/loading_widget.dart';
import '../../../../core/global_widgets/message_display_widget.dart';
import '../../../../core/global_widgets/top_bar.dart';
import '../../../../injection_container.dart';
import '../../data/models/top_manga_model.dart';
import '../manga_bloc/mangas_bloc.dart';
import '../widgets/top_manga_widgets/manga_vertical_listview.dart';
import '../widgets/top_manga_widgets/manga_vertical_listview_card.dart';

class AllTopMangaView extends StatelessWidget {
  const AllTopMangaView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MangasBloc>()..add(GetTopMangasEvent()),
      child: Scaffold(
        appBar: const TopBar(
          title: 'assets/images/Animeniac.png',
          page: 'Manga',
        ),
        body: BlocBuilder<MangasBloc, MangaState>(
          builder: (context, state) {
            if (state is LoadingMangaState) {
              return const LoadingWidget();
            } else if (state is LoadedMangaState) {
              return RefreshIndicator(
                  onRefresh: () => _onRefresh(context),
                  child: AllTopMangaWidget(manga: state.mangas));
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

class AllTopMangaWidget extends StatelessWidget {
  const AllTopMangaWidget({
    required this.manga,
    super.key,
  });

  final TopMangaModel manga;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MangasBloc, MangaState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              MangaVerticalListView(
                itemCount: manga.data!.length + 1,
                itemBuilder: (context, index) {
                  if (index < manga.data!.length) {
                    return MangaVerticalListViewCard(
                      mangaData: manga.data![index],
                    );
                  } else {
                    return const LoadingIndicator();
                  }
                },
                addEvent: () {
                  context.read<MangasBloc>().add(FetchMoreMangaEvent());
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
