import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, size: 20),
          hintText: 'Search news...',
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 8),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(56),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//           child: const CustomSearchBar(),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildSectionHeader("Categories"),
//               const SizedBox(height: 12),
//               _buildCategoryList(),
//               const SizedBox(height: 20),
//               _buildSectionHeader("News"),
//               // Add your news list or content here
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSectionHeader(String title) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             title,
//             style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildCategoryList() {
//     final categories = [
//       {"image": "https://images.unsplash.com/photo-1557804506-669a67965ba0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVhcnN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60", "title": "Campus"},
//       {"image": "https://images.unsplash.com/photo-1560353381-1c4951416f12?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8d2F0ZXJtZWxvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60", "title": "CSE"},
//       {"image": "https://images.unsplash.com/photo-1615489995949-541948a3ed95?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGJlZXRyb290c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60", "title": "ECE"},
//       // Add more categories as needed
//     ];
//
//     return SizedBox(
//       height: 100,
//       child: ListView.separated(
//         scrollDirection: Axis.horizontal,
//         itemCount: categories.length,
//         separatorBuilder: (context, index) => const SizedBox(width: 10),
//         itemBuilder: (context, index) {
//           final category = categories[index];
//           return _buildCategoryCard(category["image"]!, category["title"]!);
//         },
//       ),
//     );
//   }
//
//   Widget _buildCategoryCard(String imageUrl, String title) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Container(
//           width: 100,
//           height: 70,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             border: Border.all(color: Colors.grey.shade300, width: 1),
//             image: DecorationImage(
//               image: NetworkImage(imageUrl),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         const SizedBox(height: 6),
//         Text(
//           title,
//           style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
//           textAlign: TextAlign.center,
//         ),
//       ],
//     );
//   }
// }
//
// class CustomSearchBar extends StatelessWidget {
//   const CustomSearchBar({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 40,
//       decoration: BoxDecoration(
//         color: Colors.grey.shade100,
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: Colors.grey.shade300, width: 1),
//       ),
//       child: const TextField(
//         decoration: InputDecoration(
//           prefixIcon: Icon(Icons.search, color: Colors.grey),
//           hintText: 'Search',
//           hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
//           border: InputBorder.none,
//           contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//         ),
//         style: TextStyle(fontSize: 16, color: Colors.black),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: HomeScreen(),
//   ));
// }