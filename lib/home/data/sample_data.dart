import '../models/news_article.dart';
import '../models/banner_item.dart';

final List<BannerItem> sampleBanners = [
  BannerItem(
    id: '1',
    imageUrl: 'https://via.placeholder.com/800x400?text=Campus+Event',
    title: 'Annual Tech Fest',
  ),
  BannerItem(
    id: '2',
    imageUrl: 'https://via.placeholder.com/800x400?text=Sports+Day',
    title: 'Inter-College Sports',
  ),
  BannerItem(
    id: '3',
    imageUrl: 'https://via.placeholder.com/800x400?text=Workshop',
    title: 'AI Workshop Series',
  ),
];

final List<NewsArticle> sampleArticles = [
  NewsArticle(
    id: '1',
    title: 'CSE Department Wins Hackathon',
    summary:
    'Our computer science team secured first place in the national coding competition.',
    department: 'CSE',
    date: '2 hours ago',
    imageUrl: 'https://via.placeholder.com/400x200?text=CSE+Hackathon',
  ),
  NewsArticle(
    id: '2',
    title: 'New Mechanical Lab Inaugurated',
    summary:
    'The department has added advanced robotics equipment to its lab facilities.',
    department: 'MECH',
    date: '1 day ago',
    imageUrl: 'https://via.placeholder.com/400x200?text=MECH+Lab',
  ),
  NewsArticle(
    id: '3',
    title: 'AI Conference Highlights',
    summary:
    'AIML students presented research papers at the international AI conference.',
    department: 'AIML',
    date: '3 days ago',
    imageUrl:
    'https://www.google.com/imgres?q=Ai%20conference%20images&imgurl=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fq%3Dai%2520conference&imgrefurl=https%3A%2F%2Fdeploy.websitelearners.com%2Fai-conferences-2025-usa%2F&docid=YjpS9HH-TjUOBM&tbnid=aU__78db5GK0mM&vet=12ahUKEwjB0-m5qKuMAxVIXGwGHRDGHzEQM3oECBsQAA..i&w=474&h=262&hcb=2&itg=1&ved=2ahUKEwjB0-m5qKuMAxVIXGwGHRDGHzEQM3oECBsQAA',
  ),
];
