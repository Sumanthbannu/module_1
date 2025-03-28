import 'package:flutter/material.dart';

class DepartmentFilter extends StatelessWidget {
  final List<String> departments;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const DepartmentFilter({
    super.key,
    required this.departments,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ), // Add left and right padding here
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: departments.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: ChoiceChip(
                label: Text(departments[index]),
                selected: selectedIndex == index,
                onSelected: (selected) => onChanged(index),
              ),
            );
          },
        ),
      ),
    );
  }
}
