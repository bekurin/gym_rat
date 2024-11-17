class Exercise {
  final String agonist = "";
  final List<Equipment> equipments = [];
}

class Workout {
  final String name = "";
  final String antagonist = "";
}

class BodyWeight implements Equipment {
  final List<Workout> bodyweights = [];
}

class Dumbbell implements Equipment {
  final List<Workout> dubbells = [];
}

class Machine implements Equipment {
  final List<Workout> machines = [];
}

class Babel implements Equipment {
  final List<Workout> babels = [];
}

interface class Equipment {}
