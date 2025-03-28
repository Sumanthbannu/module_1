import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import '../models/news_article.dart';

class NewsList extends StatelessWidget {
  final List<NewsArticle> articles;
  final CacheManager _cacheManager = CacheManager(
    Config('news_cache', stalePeriod: const Duration(days: 2)),
  );

  NewsList({super.key, required this.articles}) {
    _precacheImages();
  }

  void _precacheImages() {
    for (final article in articles) {
      if (article.imageUrl != null) {
        _cacheManager.downloadFile(article.imageUrl!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) =>
            NewsCard(article: articles[index], cacheManager: _cacheManager),
        childCount: articles.length,
        addAutomaticKeepAlives: true,
        addRepaintBoundaries: true,
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final NewsArticle article;
  final CacheManager cacheManager;

  const NewsCard({
    super.key,
    required this.article,
    required this.cacheManager,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (article.imageUrl != null) _buildImageSection(context),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: _getDepartmentColor(article.department),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            article.department,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Text(
                          article.date,
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      article.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      article.summary,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.share, size: 20),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.bookmark_border, size: 20),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageSection(BuildContext context) {
    return SizedBox(
      height: 180,
      width: double.infinity,
      child: CachedNetworkImage(
        cacheManager: cacheManager,
        imageUrl: article.imageUrl!,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(color: Colors.grey.shade200),
        errorWidget:
            (context, url, error) => Container(
          color: Colors.grey.shade300,
          child: const Center(child: Icon(Icons.error, color: Colors.red)),
        ),
        fadeInDuration: const Duration(milliseconds: 300),
        memCacheHeight: (MediaQuery.of(context).size.height * 0.25).toInt(),
      ),
    );
  }

  Color _getDepartmentColor(String department) {
    switch (department) {
      case 'CSE':
        return Colors.blue.shade700;
      case 'MECH':
        return Colors.red.shade700;
      case 'AIML':
        return Colors.purple.shade700;
      case 'CIVIL':
        return Colors.orange.shade700;
      case 'IT':
        return Colors.green.shade700;
      case 'ECE':
        return Colors.teal.shade700;
      case 'EEE':
        return Colors.amber.shade700;
      default:
        return Colors.grey.shade700;
    }
  }
}
