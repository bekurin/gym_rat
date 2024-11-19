class Exercise {
  final String agonist;
  final List<Workout> bodyweights;
  final List<Workout> dubbells;
  final List<Workout> machines;
  final List<Workout> babels;

  Exercise(
      {required this.agonist,
      required this.bodyweights,
      required this.dubbells,
      required this.machines,
      required this.babels});

  int getTotalElement() {
    return bodyweights.length +
        dubbells.length +
        machines.length +
        babels.length;
  }

  List<Workout> getAllWorkout() {
    List<Workout> workouts = List.empty(growable: true);
    workouts.addAll(bodyweights);
    workouts.addAll(dubbells);
    workouts.addAll(machines);
    workouts.addAll(babels);
    return workouts;
  }

  static Exercise fromJson(Map<String, dynamic> json) {
    var bodywegihtList = json["bodyweights"] as List;
    var dubbelList = json["dumbbells"] as List;
    var machineList = json["machines"] as List;
    var babelList = json["babels"] as List;

    return Exercise(
      agonist: json["agonist"],
      bodyweights:
          bodywegihtList.map((item) => Workout.fromJson(item)).toList(),
      dubbells: dubbelList.map((item) => Workout.fromJson(item)).toList(),
      machines: machineList.map((item) => Workout.fromJson(item)).toList(),
      babels: babelList.map((item) => Workout.fromJson(item)).toList(),
    );
  }
}

class Workout {
  final int id;
  final String name;
  final String antagonist;

  Workout({required this.id, required this.name, required this.antagonist});

  static Workout fromJson(Map<String, dynamic> json) {
    return Workout(
        id: json["id"], name: json["name"], antagonist: json["antagonist"]);
  }
}
