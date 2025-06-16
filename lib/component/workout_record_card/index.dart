import 'package:flutter/material.dart';
import 'package:gym_rat/model/workout_record.dart';
import 'package:gym_rat/const/colors.dart';

class WorkoutRecordCard extends StatelessWidget {
  final WorkoutRecord record;

  const WorkoutRecordCard({super.key, required this.record});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: PRIMARY_COLOR),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  record.title,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(record.memo),
                const SizedBox(height: 8.0),
                Text(
                  '총 볼륨: ${record.getTotalVolume().toStringAsFixed(1)} kg',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1.0),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: record.exercises.length,
            itemBuilder: (context, index) {
              final exercise = record.exercises[index];
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exercise.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    ...exercise.rounds.map((round) => Padding(
                          padding:
                              const EdgeInsets.only(left: 16.0, bottom: 4.0),
                          child: Text(
                            '${round.type}: ${round.weight}kg × ${round.repetitions}회',
                          ),
                        )),
                    Text(
                      '운동 볼륨: ${exercise.getTotalVolume().toStringAsFixed(1)} kg',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
