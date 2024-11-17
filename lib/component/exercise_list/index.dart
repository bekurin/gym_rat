import 'package:flutter/material.dart';

class ExerciseList extends StatelessWidget {
  final List<String> exercises;

  const ExerciseList({super.key, required this.exercises});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(exercises[index]),
          );
        },
      ),
    );
  }
}
