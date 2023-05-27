import 'widgets.imports.dart';

class AnimeDetailsCard extends StatefulWidget {
  const AnimeDetailsCard({
    required this.detailsWidget,
    super.key,
    required this.animeDetails,
  });

  final Widget detailsWidget;
  final AnimeData animeDetails;

  @override
  State<AnimeDetailsCard> createState() => _AnimeDetailsCardState();
}

class _AnimeDetailsCardState extends State<AnimeDetailsCard> {
  bool isFav = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  String? docId;

  @override
  void initState() {
    super.initState();
    doesFavAlreadyExist(widget.animeDetails.malId);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Stack(children: [
      AnimeSliderCardImage(
          imageUrl: widget.animeDetails.images!.jpg!.largeImageUrl!),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
              height: size.height * 0.6,
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.animeDetails.titleEnglish ??
                                    widget.animeDetails.title!,
                                maxLines: 2,
                                style: textTheme.titleMedium,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 4,
                                  bottom: 6,
                                ),
                                child: widget.detailsWidget,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Rating : ${widget.animeDetails.rating} ',
                                    style: textTheme.bodyMedium,
                                  ),
                                  if (widget.animeDetails.rank != null) ...[
                                    Text(
                                      'Rank : ${widget.animeDetails.rank!.toString()} ,',
                                      style: textTheme.bodySmall,
                                    ),
                                  ],
                                ],
                              ),
                            ],
                          ),
                        ),
                        if (widget.animeDetails.trailer!.url != null) ...[
                          InkWell(
                              onTap: () async {
                                final url = Uri.parse(
                                    widget.animeDetails.trailer!.url!);
                                if (!await launchUrl(url)) {
                                  throw Exception('Could not launch $url');
                                }
                              },
                              child: Container(
                                  height: 10.h,
                                  width: 10.w,
                                  decoration: const BoxDecoration(
                                    color: primaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.play_arrow_rounded,
                                  )))
                        ]
                      ])))),
      Padding(
          padding: const EdgeInsets.only(
            top: 12,
            left: 16,
            right: 16,
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            FirebaseAuth.instance.currentUser != null
                ? InkWell(
                    onTap: () async {
                      if (!isFav) {
                        FirebaseFirestore.instance
                            .collection('users')
                            .doc(auth.currentUser!.uid)
                            .collection('watchList')
                            .add({
                          'date': DateTime.now(),
                          'malId': widget.animeDetails.malId,
                          'posterUrl':
                              widget.animeDetails.images!.jpg!.imageUrl,
                          'rating': widget.animeDetails.rating,
                          'releaseDate': widget.animeDetails.year,
                          'score': widget.animeDetails.score,
                          'title': widget.animeDetails.titleEnglish ??
                              widget.animeDetails.title,
                          'largeImage':
                              widget.animeDetails.images!.jpg!.largeImageUrl,
                          'rank': widget.animeDetails.rank,
                          'trailer': widget.animeDetails.trailer!.url,
                          'description': widget.animeDetails.synopsis,
                          'episodes': widget.animeDetails.episodes,
                        });
                      } else {
                        FirebaseFirestore.instance
                            .collection('users')
                            .doc(auth.currentUser!.uid)
                            .collection('watchList')
                            .doc(docId)
                            .delete();
                      }

                      setState(() {
                        isFav = !isFav;
                      });
                    },
                    child: Icon(
                      isFav
                          ? Icons.favorite_sharp
                          : Icons.favorite_border_sharp,
                      color: secondaryColor,
                      size: 35,
                    ))
                : InkWell(
                    onTap: () {
                      CustomNavigator.push(
                        Routes.signIn,
                      );
                    },
                    child: const Icon(
                      Icons.favorite_border_sharp,
                      color: secondaryColor,
                      size: 35,
                    ))
          ]))
    ]));
  }

  //functions
  void doesFavAlreadyExist(malId) async {
    if (FirebaseAuth.instance.currentUser != null) {
      final QuerySnapshot result = await FirebaseFirestore.instance
          .collection('users')
          .doc(auth.currentUser!.uid)
          .collection('watchList')
          .where('malId', isEqualTo: malId)
          .limit(1)
          .get();
      final List<DocumentSnapshot> documents = result.docs;
      setState(() {
        isFav = documents.length == 1;
        if (isFav) docId = documents.first.id;
      });
    }
  }
}
