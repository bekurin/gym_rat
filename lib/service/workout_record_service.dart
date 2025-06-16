import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:gym_rat/model/workout_record.dart';

class WorkoutRecordService {
  static Future<List<WorkoutRecord>> loadRecords() async {
    try {
      final String response =
          await rootBundle.loadString('assets/json/info.json');
      final data = json.decode(response) as Map<String, dynamic>;
      return [WorkoutRecord.fromJson(data)];
    } catch (e) {
      print('Error loading workout records: $e');
      return [];
    }
  }

  static Future<WorkoutRecord?> getRecordForDate(DateTime date) async {
    final records = await loadRecords();
    try {
      return records.firstWhere(
        (record) =>
            record.date.year == date.year &&
            record.date.month == date.month &&
            record.date.day == date.day,
      );
    } catch (e) {
      return null;
    }
  }
}
