import 'package:flutter/material.dart';
import 'package:gym_rat/component/main_calendar/index.dart';
import 'package:gym_rat/component/workout_record_card/index.dart';
import 'package:gym_rat/const/texts.dart';
import 'package:gym_rat/model/workout_record.dart';
import 'package:gym_rat/screen/select_screen.dart';
import 'package:gym_rat/service/workout_record_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  DateTime selectedDate = DateTime.now();
  WorkoutRecord? selectedRecord;

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Future<void> _onDaySelected(
      DateTime selectedDate, DateTime focusedDate) async {
    setState(() {
      this.selectedDate = selectedDate;
    });

    final record = await WorkoutRecordService.getRecordForDate(selectedDate);
    setState(() {
      selectedRecord = record;
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
              if (selectedRecord != null)
                WorkoutRecordCard(record: selectedRecord!)
              else
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('이 날의 운동 기록이 없습니다.'),
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
