import 'package:gym_rat/model/round.dart';

class Exercise {
  final String name;
  final List<Round> rounds;

  Exercise({required this.name, required this.rounds});

  static Exercise fromJson(Map<String, dynamic> json) {
    var roundsString = json["rounds"] as List;
    var rounds = roundsString
        .map((roundString) => Round.fromJson(roundString))
        .toList();
    return Exercise(name: json["name"], rounds: rounds);
  }
}
