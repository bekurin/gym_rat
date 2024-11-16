import 'package:flutter/material.dart';

class InfiniteTab extends StatefulWidget {
  final List<String> titles;

  const InfiniteTab({super.key, required this.titles});

  @override
  State<InfiniteTab> createState() => _InfiniteTabState();
}

class _InfiniteTabState extends State<InfiniteTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late List<Tab> _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = widget.titles.map((title) => Tab(text: title)).toList();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          color: Colors.grey[200],
          child: TabBar(
            controller: _tabController,
            isScrollable: true, // 가로 스크롤 가능하도록 설정
            tabs: _tabs,
            indicatorColor: Colors.blue,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
          ),
        ),
      ],
    );
  }
}
