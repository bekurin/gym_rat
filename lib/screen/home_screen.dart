import 'package:flutter/material.dart';
import 'package:gym_rat/component/main_calendar/index.dart';
import 'package:gym_rat/const/texts.dart';
import 'package:gym_rat/screen/select_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  DateTime selectedDate = DateTime.now();

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onDaySelected(DateTime selectedDate, DateTime focusedDate) {
    setState(() {
      this.selectedDate = selectedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [
      Center(
        child: SafeArea(
          child: Column(
            children: [
              MainCalendar(
                selectedDate: selectedDate,
                onDaySelected: _onDaySelected,
              ),
            ],
          ),
        ),
      ),
      const Center(
        child: SafeArea(child: SelectScreen()),
      ),
      const Center(
        child: Text("만드는 중"),
      )
    ];

    return Scaffold(
      appBar: AppBar(title: const Text(HOME_SCREEN_TITLE)),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: IndexedStack(
          index: _currentIndex,
          children: children,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '메인',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '루틴 생성',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.yard),
            label: '운동 시작',
          ),
        ],
      ),
    );
  }
}
