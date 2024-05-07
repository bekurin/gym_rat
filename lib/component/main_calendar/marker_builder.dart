import 'package:flutter/material.dart';
import 'package:gym_rat/model/marker_event.dart';

Widget markerBuilder(BuildContext context, DateTime date, List<dynamic> events) {
  if (events.length != 1) {
    throw ArgumentError("이벤트는 1개뿐이여야 합니다.");
  }

  MarkerEvent markerEvent = events.first as MarkerEvent;
  if (markerEvent.hasNothing()) {
    return Container();
  }

  return Positioned(
    bottom: 1,
    left: 0,
    right: 0,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: buildEventMarkers(markerEvent),
    ),
  );
}

List<Widget> buildEventMarkers(MarkerEvent markerEvent) {
  return [
    if (markerEvent.hasCompletedWorkout)
      buildMarker(Colors.blue),
    if (markerEvent.hasWrittenMemo)
      buildMarker(Colors.yellow),
    if (markerEvent.hasEnteredBodyInfo)
      buildMarker(Colors.green),
  ];
}

Widget buildMarker(Color color) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 1.0),
    width: 6.0,
    height: 6.0,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: color,
    ),
  );
}
