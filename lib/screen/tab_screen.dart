import 'package:flutter/material.dart';
import 'package:gym_rat/component/tab/infinite_tab.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Column(
        children: [
          InfiniteTab(titles: ["전체", "가슴", "등", "하체", "어깨"]),
          InfiniteTab(titles: ["전체", "머신", "맨몸", "덤벨", "바벨"])
        ],
      ),
    );
  }
}
