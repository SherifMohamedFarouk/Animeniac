import 'top_manga_imports.dart';

class TopMangaView extends StatelessWidget {
  const TopMangaView({super.key});

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
