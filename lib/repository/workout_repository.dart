import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:gym_rat/model/workout.dart';

class WorkoutRepository {
  static Future<Workout> getWorkout() async {
    String jsonString = await rootBundle.loadString("assets/json/info.json");
    Map<String, dynamic> decodedJsonString = jsonDecode(jsonString);
    return Workout.fromJson(decodedJsonString);
  }
}
