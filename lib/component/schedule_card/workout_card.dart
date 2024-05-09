import 'package:flutter/material.dart';
import 'package:gym_rat/component/schedule_card/content.dart';
import 'package:gym_rat/const/colors.dart';
import 'package:gym_rat/model/workout.dart';

class WorkoutCard extends StatelessWidget {
  final Workout workout;

  const WorkoutCard({super.key, required this.workout});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: PRIMARY_COLOR,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Content(content: workout.title),
            VerticalDivider(color: PRIMARY_COLOR),
            Content(content: workout.memo),
            VerticalDivider(color: PRIMARY_COLOR),
            Content(content: "${workout.getTotalWeight()} kg")
          ],
        ),
      ),
    );
  }
}
