class WorkoutRecord {
  final DateTime date;
  final String title;
  final String memo;
  final List<ExerciseRecord> exercises;

  WorkoutRecord({
    required this.date,
    required this.title,
    required this.memo,
    required this.exercises,
  });

  double getTotalVolume() {
    return exercises.fold(
        0.0, (sum, exercise) => sum + exercise.getTotalVolume());
  }

  static WorkoutRecord fromJson(Map<String, dynamic> json) {
    return WorkoutRecord(
      date: DateTime.parse(json['date']),
      title: json['title'],
      memo: json['memo'],
      exercises: (json['exercises'] as List)
          .map((e) => ExerciseRecord.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'title': title,
      'memo': memo,
      'exercises': exercises.map((e) => e.toJson()).toList(),
    };
  }
}

class ExerciseRecord {
  final String name;
  final List<Round> rounds;

  ExerciseRecord({
    required this.name,
    required this.rounds,
  });

  double getTotalVolume() {
    return rounds.fold(
        0.0, (sum, round) => sum + (round.weight * round.repetitions));
  }

  static ExerciseRecord fromJson(Map<String, dynamic> json) {
    return ExerciseRecord(
      name: json['name'],
      rounds: (json['rounds'] as List).map((e) => Round.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'rounds': rounds.map((e) => e.toJson()).toList(),
    };
  }
}

class Round {
  final String type;
  final double weight;
  final int repetitions;

  Round({
    required this.type,
    required this.weight,
    required this.repetitions,
  });

  static Round fromJson(Map<String, dynamic> json) {
    return Round(
      type: json['type'],
      weight: json['weight'].toDouble(),
      repetitions: json['repetitions'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'weight': weight,
      'repetitions': repetitions,
    };
  }
}
