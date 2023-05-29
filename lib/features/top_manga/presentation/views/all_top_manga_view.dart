import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/global_widgets/loading_indicator.dart';
import '../../../../core/global_widgets/loading_widget.dart';
import '../../../../core/global_widgets/message_display_widget.dart';
import '../../../../core/global_widgets/top_bar.dart';
import '../../../../injection_container.dart';
import '../../data/models/classes/manga_data.dart';
import '../manga_bloc/mangas_bloc.dart';
import '../widgets/top_manga_widgets/manga_vertical_listview.dart';
import '../widgets/top_manga_widgets/manga_vertical_listview_card.dart';

class AllTopMangaView extends StatefulWidget {
  const AllTopMangaView({super.key});

  @override
  State<AllTopMangaView> createState() => _AllTopMangaViewState();
}

class _AllTopMangaViewState extends State<AllTopMangaView> {
  List<MangaData> mangaList = [];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MangasBloc>()..add(GetTopMangasEvent()),
      child: Scaffold(
        appBar: const TopBar(
          title: 'assets/images/anime3.png',
          page: 'Manga',
        ),
        body: BlocConsumer<MangasBloc, MangaState>(
          listener: (context, state) {
            if (state is LoadedMangaState) {
              mangaList.addAll(state.mangas.data!);
            } else if (state is LoadMoreMangaState) {
              mangaList.addAll(state.mangas.data!);
            }
          },
          builder: (context, state) {
            if (state is LoadingMangaState) {
              return const LoadingWidget();
            } else if (state is ErrorMangasState) {
              return MessageDisplayWidget(message: state.message);
            }
            return RefreshIndicator(
                onRefresh: () => _onRefresh(context),
                child: AllTopMangaWidget(mangas: mangaList));
          },
        ),
      ),
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<MangasBloc>(context).add(RefreshMangasEvent());
  }
}

class AllTopMangaWidget extends StatefulWidget {
  const AllTopMangaWidget({
    required this.mangas,
    super.key,
  });

  final List<MangaData> mangas;

  @override
  State<AllTopMangaWidget> createState() => _AllTopMangaWidgetState();
}

class _AllTopMangaWidgetState extends State<AllTopMangaWidget> {
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();

    _scrollController.addListener((() {
      _onScroll();
    }));
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MangasBloc, MangaState>(
      builder: (context, state) {
        return SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              MangaVerticalListView(
                itemCount: widget.mangas.length + 1,
                itemBuilder: (context, index) {
                  if (index < widget.mangas.length) {
                    return MangaVerticalListViewCard(
                      mangaData: widget.mangas[index],
                    );
                  } else {
                    return const LoadingIndicator();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      context.read<MangasBloc>().add(FetchMoreMangaEvent());
    }
  }
}
