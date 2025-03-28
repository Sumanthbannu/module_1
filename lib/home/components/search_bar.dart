
import 'package:flutter/material.dart';

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

