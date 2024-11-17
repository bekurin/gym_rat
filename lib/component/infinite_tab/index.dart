import 'package:flutter/material.dart';

class InfiniteTab extends StatelessWidget {
  final String selectedItem;
  final Function(String) onItemSelected;
  final List<String> selectGroups;

  const InfiniteTab(
      {super.key,
      required this.selectGroups,
      required this.selectedItem,
      required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: selectGroups.map((item) {
          return GestureDetector(
            onTap: () => onItemSelected(item),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: selectedItem == item ? Colors.blue : Colors.grey[300],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                item,
                style: TextStyle(
                  color: selectedItem == item ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
