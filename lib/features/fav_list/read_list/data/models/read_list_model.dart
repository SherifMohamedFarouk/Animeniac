class ReadListModel {
  final String? title, status, posterUrl, largeImage, url, description;
  final dynamic score;
  final int? malId, releaseDate, rank, chapters;
  ReadListModel(
      {required this.chapters,
      required this.description,
      required this.url,
      required this.rank,
      required this.title,
      required this.status,
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
      'status': status,
      'largeImage': largeImage,
      'rank': rank,
      'url': url,
      'episdoes': chapters,
      'description': description
    };
  }
}
