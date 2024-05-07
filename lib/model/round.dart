class Round {
  final RoundType roundType;
  final int weight;
  final int repetitions;

  Round(
      {required this.roundType,
      required this.weight,
      required this.repetitions});

  static Round fromJson(Map<String, dynamic> json) {
    return Round(
        roundType: RoundType
            .values
            .firstWhere((element) => element.name == json["type"]),
        weight: json["weight"],
        repetitions: json["repetitions"]);
  }
}

enum RoundType { MAIN, DROP, WARM_UP }
