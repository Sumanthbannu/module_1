import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import '../models/banner_item.dart';

class BannerCarousel extends StatefulWidget {
  final List<BannerItem> banners;

  const BannerCarousel({super.key, required this.banners});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  late final PageController _pageController;
  late final CacheManager _cacheManager;
  int _currentPage = 0;
  Timer? _autoScrollTimer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.95); // Wider items
    _cacheManager = CacheManager(
      Config('banner_cache', stalePeriod: const Duration(days: 7)),
    );
    _precacheImages();
    _startAutoScroll();
  }

  void _precacheImages() {
    for (final banner in widget.banners) {
      _cacheManager.downloadFile(banner.imageUrl);
    }
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (mounted && widget.banners.length > 1) {
        final nextPage = (_currentPage + 1) % widget.banners.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOutCubic,
        );
      }
    });
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Column(
      children: [
        SizedBox(
          height: 220,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.banners.length,
            onPageChanged: (index) => setState(() => _currentPage = index),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final banner = widget.banners[index];
              return AnimatedPadding(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                padding: EdgeInsets.all(
                  _currentPage == index ? 6 : 10,
                ), // Adjusted padding
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CachedNetworkImage(
                        cacheManager: _cacheManager,
                        imageUrl: banner.imageUrl,
                        fit: BoxFit.cover,
                        placeholder:
                            (context, url) => Container(
                          color: colors.surfaceVariant.withOpacity(0.3),
                        ),
                        errorWidget:
                            (context, url, error) => Container(
                          color: colors.surfaceVariant,
                          child: Icon(
                            Icons.broken_image,
                            color: colors.error,
                            size: 40,
                          ),
                        ),
                        fadeInDuration: const Duration(milliseconds: 500),
                        fadeInCurve: Curves.easeInOut,
                        memCacheHeight:
                        (MediaQuery.of(context).size.height * 0.3).toInt(),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.7),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 16,
                        bottom: 20,
                        right: 16,
                        child: Text(
                          banner.title,
                          style: theme.textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            shadows: [
                              const Shadow(
                                blurRadius: 5,
                                color: Colors.black45,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.banners.length,
                (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 8,
              width: _currentPage == index ? 16 : 8,
              decoration: BoxDecoration(
                color:
                _currentPage == index
                    ? colors.primary
                    : colors.outline.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
