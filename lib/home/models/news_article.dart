class NewsArticle {
  final String id;
  final String title;
  final String summary;
  final String department;
  final String date;
  final String? imageUrl;

  NewsArticle({
    required this.id,
    required this.title,
    required this.summary,
    required this.department,
    required this.date,
    this.imageUrl,
  });
}
