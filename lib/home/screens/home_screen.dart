
import 'package:college_project/home/components/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:college_project/home/components/department_filter.dart';
import 'package:college_project/home/components/news_list.dart';
import '../data/sample_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ScrollController _scrollController;
  bool _showBanner = true;
  bool _isLoading = true;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_handleScroll);
    _loadData();
  }

  Future<void> _loadData() async {
    await Future.delayed(const Duration(milliseconds: 800));
    if (mounted) {
      setState(() => _isLoading = false);
    }
  }

  void _handleScroll() {
    final shouldShow = _scrollController.offset < 150;
    if (shouldShow != _showBanner) {
      setState(() => _showBanner = shouldShow);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.black38,
        color: Colors.grey,
        animationDuration: const Duration(milliseconds: 300),
        items: const <Widget>[
          Icon(Icons.home, size: 26, color: Colors.black87),
          Icon(Icons.notifications, size: 26, color: Colors.black87),
          Icon(Icons.person, size: 26, color: Colors.black87),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      backgroundColor: Colors.white,
      body: _isLoading
          ? _buildShimmerLoader(theme)
          : CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        cacheExtent: 500,
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 120,
            toolbarHeight: 60,
            backgroundColor: colors.surface,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 16, bottom: 16),
              background: _showBanner
                  ? BannerCarousel(banners: sampleBanners)
                  : null,
              title: _showBanner
                  ? null
                  : Text(
                'Campus News',
                style: textTheme.titleLarge?.copyWith(
                  color: colors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            centerTitle: false,
            elevation: 1,
            iconTheme: IconThemeData(color: colors.primary),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomSearchBar(),
                  const SizedBox(height: 16),
                  _buildSectionHeader('Categories'),
                  _buildCategoryList(),
                  const SizedBox(height: 16),
                  _buildSectionHeader('Department News'),
                  const SizedBox(height: 8),
                  Column(
                    children: newsItems.map((item) => _buildNewsCard(item)).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShimmerLoader(ThemeData theme) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
        strokeWidth: 2,
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildCategoryList() {
    final categories = [
      {
        "image":
        "https://images.unsplash.com/photo-1557804506-669a67965ba0?ixlib=rb-4.0.3",
        "title": "Campus"
      },
      {
        "image":
        "https://images.unsplash.com/photo-1560353381-1c4951416f12?ixlib=rb-4.0.3",
        "title": "CSE"
      },
      {
        "image":
        "https://images.unsplash.com/photo-1615489995949-541948a3ed95?ixlib=rb-4.0.3",
        "title": "ECE"
      },
      {
        "image":
        "https://images.unsplash.com/photo-1615489995949-541948a3ed95?ixlib=rb-4.0.3",
        "title": "MECH"
      },
      {
        "image":
        "https://images.unsplash.com/photo-1615489995949-541948a3ed95?ixlib=rb-4.0.3",
        "title": "CIVIL"
      },
      {
        "image":
        "https://images.unsplash.com/photo-1615489995949-541948a3ed95?ixlib=rb-4.0.3",
        "title": "IT"
      },
      {
        "image":
        "https://images.unsplash.com/photo-1615489995949-541948a3ed95?ixlib=rb-4.0.3",
        "title": "EEE"
      },
      {
        "image":
        "https://images.unsplash.com/photo-1615489995949-541948a3ed95?ixlib=rb-4.0.3",
        "title": "AIML"
      },
    ];

    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = categories[index];
          return _buildCategoryCard(category["image"]!, category["title"]!);
        },
      ),
    );
  }

  Widget _buildCategoryCard(String imageUrl, String title) {
    return SizedBox(
      width: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300, width: 1),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: const TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          hintText: 'Search',
          hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        ),
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }
}

class NewsItem {
  final String department;
  final String title;
  final String description;
  final String timeAgo;

  NewsItem({
    required this.department,
    required this.title,
    required this.description,
    required this.timeAgo,
  });
}

final List<NewsItem> newsItems = [
  NewsItem(
    department: 'CSE',
    title: 'CSE Department Wins Hackathon',
    description:
    'Our computer science team secured first place in the national coding competition.',
    timeAgo: '2 hours ago',
  ),
  NewsItem(
    department: 'MECH',
    title: 'New Mechanical Lab Inaugurated',
    description:
    'The department has added advanced robotics equipment to its lab facilities.',
    timeAgo: '1 day ago',
  ),
  NewsItem(
    department: 'ECE',
    title: 'Electronics Club Organizes Workshop',
    description:
    'The ECE department’s electronics club successfully conducted a workshop on embedded systems.',
    timeAgo: '5 hours ago',
  ),
  NewsItem(
    department: 'EEE',
    title: 'Electrical Engineering Students Visit Power Plant',
    description:
    'Students from the EEE department had an insightful visit to a nearby power generation plant.',
    timeAgo: '10 hours ago',
  ),
  NewsItem(
    department: 'IT',
    title: 'IT Department Hosts Guest Lecture on Cybersecurity',
    description:
    'A leading cybersecurity expert delivered a guest lecture to the Information Technology students.',
    timeAgo: '1 day ago',
  ),
  NewsItem(
    department: 'AIML',
    title: 'AI and ML Seminar Attracts Enthusiasts',
    description:
    'The recent seminar on Artificial Intelligence and Machine Learning saw enthusiastic participation from students and faculty.',
    timeAgo: '12 hours ago',
  ),
  // Add more news items here
];

Widget _buildNewsCard(NewsItem item) {
  Color departmentColor;
  switch (item.department) {
    case 'CSE':
      departmentColor = Colors.blue;
      break;
    case 'MECH':
      departmentColor = Colors.redAccent;
      break;
    case 'ECE':
      departmentColor = Colors.green;
      break;
    case 'EEE':
      departmentColor = Colors.orange;
      break;
    case 'IT':
      departmentColor = Colors.purple;
      break;
    case 'AIML':
      departmentColor = Colors.teal;
      break;
    default:
      departmentColor = Colors.grey;
  }

  return Container(
    margin: const EdgeInsets.only(bottom: 12.0),
    padding: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              decoration: BoxDecoration(
                color: departmentColor,
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Text(
                item.department,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                ),
              ),
            ),
            Text(
              item.timeAgo,
              style: TextStyle(color: Colors.grey.shade600, fontSize: 12.0),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Text(
          item.title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          item.description,
          style: TextStyle(color: Colors.grey.shade700, fontSize: 14.0),
        ),
        const SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: const Icon(Icons.share_outlined),
              onPressed: () {
                // Handle share action
                print('Share ${item.title}');
              },
              iconSize: 20.0,
            ),
            const SizedBox(width: 8.0),
            IconButton(
              icon: const Icon(Icons.bookmark_border_outlined),
              onPressed: () {
                // Handle bookmark action
                print('Bookmark ${item.title}');
              },
              iconSize: 20.0,
            ),
          ],
        ),
      ],
    ),
  );
}