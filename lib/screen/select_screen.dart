import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_rat/component/exercise_list/index.dart';
import 'package:gym_rat/component/infinite_tab/index.dart';
import 'package:gym_rat/model/exercise.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({super.key});

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  String _muscle = "전체";
  String _equipment = "전체";
  Map<String, Exercise> _exercises = {};

  final List<String> muscleGroups = ["전체", "가슴", "등", "하체", "어깨"];
  final List<String> equipmentTypes = ["전체", "머신", "맨몸", "덤벨", "바벨"];

  @override
  void initState() {
    super.initState();
    _loadExercises();
  }

  Future<void> _loadExercises() async {
    final String response =
        await rootBundle.loadString('assets/json/exercises.json');
    final data = json.decode(response) as Map<String, dynamic>;

    final exercises = Map<String, Exercise>.fromEntries(
      (data["items"] as List).map((item) {
        final exercise = Exercise.fromJson(item as Map<String, dynamic>);
        return MapEntry(exercise.agonist, exercise);
      }),
    );

    setState(() {
      _exercises = exercises;
    });
  }

  Exercise? getFilteredExercises() {
    print(_exercises[_muscle]
        ?.getAllWorkout()
        .map((item) => item.name)
        .toString());
    return _exercises[_muscle];
  }

  void _onMuscleSelected(String muscle) {
    setState(() {
      _muscle = muscle;
    });
  }

  void _onEquipmentSelected(String equipment) {
    setState(() {
      _equipment = equipment;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          InfiniteTab(
            selectGroups: muscleGroups,
            selectedItem: _muscle,
            onItemSelected: _onMuscleSelected,
          ),
          const SizedBox(height: 16),
          InfiniteTab(
            selectGroups: equipmentTypes,
            selectedItem: _equipment,
            onItemSelected: _onEquipmentSelected,
          ),
          const SizedBox(height: 24),
          _exercises.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ExerciseList(exercise: getFilteredExercises()),
        ],
      ),
    );
  }
}
