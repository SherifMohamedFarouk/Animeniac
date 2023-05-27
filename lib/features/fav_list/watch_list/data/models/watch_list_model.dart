class WatchListModel {
  final String? title, rating, posterUrl, largeImage, trailer, description;
  final dynamic score;
  final int? malId, releaseDate, rank, episodes;
  WatchListModel(
      {required this.episodes,
      required this.description,
      required this.trailer,
      required this.rank,
      required this.title,
      required this.rating,
      required this.releaseDate,
      required this.posterUrl,
      required this.score,
      required this.malId,
      required this.largeImage});

  Map<String, dynamic> toMap() {
    return {
      'malId': malId,
      'title': title,
      'releaseDate': releaseDate,
      'score': score,
      'posterUrl': posterUrl,
      'rating': rating,
      'largeImage': largeImage,
      'rank': rank,
      'trailer': trailer,
      'episdoes': episodes,
      'description': description
    };
  }
}
