import 'package:animeniac/features/top_anime/data/models/classes/anime_data.dart';

import 'top_anime_imports.dart';

class AllTopAnimeView extends StatefulWidget {
  const AllTopAnimeView({super.key});

  @override
  State<AllTopAnimeView> createState() => _AllTopAnimeViewState();
}

class _AllTopAnimeViewState extends State<AllTopAnimeView> {
  List<AnimeData> animeList = [];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AnimesBloc>()..add(GetTopAnimesEvent()),
      child: Scaffold(
        appBar: const TopBar(
          title: 'assets/images/Animeniac.png',
          page: 'Anime',
        ),
        body: BlocConsumer<AnimesBloc, AnimeState>(
          listener: (context, state) {
            if (state is LoadedAnimeState) {
              animeList.addAll(state.animes.data!);
            } else if (state is LoadMoreAnimeState) {
              animeList.addAll(state.animes.data!);
            }
          },
          builder: (context, state) {
            if (state is LoadingAnimeState) {
              return const LoadingWidget();
            } else if (state is ErrorAnimesState) {
              return MessageDisplayWidget(message: state.message);
            }
            return RefreshIndicator(
                onRefresh: () => _onRefresh(context),
                child: AllTopAnimeWidget(animes: animeList));
          },
        ),
      ),
    );
  }

  Future<void> _onRefresh(BuildContext context) async {
    BlocProvider.of<AnimesBloc>(context).add(RefreshAnimesEvent());
  }
}

class AllTopAnimeWidget extends StatefulWidget {
  const AllTopAnimeWidget({
    required this.animes,
    super.key,
  });

  final List<AnimeData> animes;

  @override
  State<AllTopAnimeWidget> createState() => _AllTopAnimeWidgetState();
}

class _AllTopAnimeWidgetState extends State<AllTopAnimeWidget> {
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
    return BlocBuilder<AnimesBloc, AnimeState>(
      builder: (context, state) {
        return SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              AnimeVerticalListView(
                itemCount: widget.animes.length + 1,
                itemBuilder: (context, index) {
                  if (index < widget.animes.length) {
                    return AnimeVerticalListViewCard(
                      animeData: widget.animes[index],
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
      context.read<AnimesBloc>().add(FetchMoreAnimeEvent());
    }
  }
}
