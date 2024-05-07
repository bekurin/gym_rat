import 'package:flutter/material.dart';
import 'package:gym_rat/component/schedule_card/content.dart';
import 'package:gym_rat/const/colors.dart';
import 'package:gym_rat/model/workout.dart';

class ScheduleCard extends StatelessWidget {
  final Workout workout;

  const ScheduleCard({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: PRIMARY_COLOR,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Content(content: workout.title),
              SizedBox(width: 16.0),
              Content(content: workout.memo),
            ],
          ),
        ),
      ),
    );
  }
}
