import 'manga_details_card_imports.dart';

class MangaDetailsCard extends StatefulWidget {
  const MangaDetailsCard({
    required this.detailsWidget,
    super.key,
    required this.mangaDetails,
  });

  final Widget detailsWidget;
  final MangaData mangaDetails;

  @override
  State<MangaDetailsCard> createState() => _MangaDetailsCardState();
}

class _MangaDetailsCardState extends State<MangaDetailsCard> {
  bool isFav = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  String? docId;

  @override
  void initState() {
    super.initState();
    doesFavAlreadyExist(widget.mangaDetails.malId);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Stack(children: [
      MangaSliderCardImage(
          imageUrl: widget.mangaDetails.images!.jpg!.largeImageUrl!),
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
                        widget.mangaDetails.titleEnglish ??
                            widget.mangaDetails.title!,
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
                            'Status : ${widget.mangaDetails.status} ,',
                            style: textTheme.bodyMedium,
                          ),
                          Text(
                            'Rank : ${widget.mangaDetails.rank!.toString()}',
                            style: textTheme.bodySmall,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                if (widget.mangaDetails.url != null) ...[
                  InkWell(
                    onTap: () async {
                      final url = Uri.parse(widget.mangaDetails.url!);
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
                        Icons.menu_book_sharp,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
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
                            .collection('readList')
                            .add({
                          'date': DateTime.now(),
                          'malId': widget.mangaDetails.malId,
                          'posterUrl':
                              widget.mangaDetails.images!.jpg!.imageUrl,
                          'status': widget.mangaDetails.status,
                          'releaseDate':
                              widget.mangaDetails.published!.prop!.from!.year,
                          'score': widget.mangaDetails.score,
                          'title': widget.mangaDetails.titleEnglish ??
                              widget.mangaDetails.title,
                          'largeImage':
                              widget.mangaDetails.images!.jpg!.largeImageUrl,
                          'rank': widget.mangaDetails.rank,
                          'url': widget.mangaDetails.url,
                          'description': widget.mangaDetails.synopsis,
                          'chapters': widget.mangaDetails.chapters,
                        });
                      } else {
                        FirebaseFirestore.instance
                            .collection('users')
                            .doc(auth.currentUser!.uid)
                            .collection('readList')
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
          .collection('readList')
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
