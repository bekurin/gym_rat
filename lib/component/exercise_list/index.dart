import 'package:flutter/material.dart';
import 'package:gym_rat/model/exercise.dart';

class ExerciseList extends StatelessWidget {
  final Exercise? exercise;

  const ExerciseList({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: exercise
                ?.getAllWorkout()
                .map((workout) => ListTile(
                      title: Text(workout.name),
                    ))
                .toList() ??
            List.empty(),
      ),
    );
  }
}
