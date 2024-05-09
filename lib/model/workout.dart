import 'package:gym_rat/model/exercise.dart';

class Workout {
  final DateTime date;
  final String title;
  final String memo;
  final List<Exercise> exercises;

  Workout(
      {required this.date,
      required this.title,
      required this.memo,
      required this.exercises});

  static Workout fromJson(Map<String, dynamic> json) {
    var exercisesString = json["exercises"] as List;
    var exercises = exercisesString
        .map((exerciseString) => Exercise.fromJson(exerciseString))
        .toList();
    return Workout(
      date: DateTime.parse(json["date"]),
      title: json["title"],
      memo: json["memo"],
      exercises: exercises,
    );
  }

  int getTotalWeight() {
    return exercises
        .expand((exercise) => exercise.rounds)
        .map((round) => round.weight)
        .reduce((weight, totalWeight) => weight + totalWeight);
  }
}
