class BannerItem {
  final String id;
  final String imageUrl;
  final String title;
  final String? actionUrl;

  BannerItem({
    required this.id,
    required this.imageUrl,
    required this.title,
    this.actionUrl,
  });
}
