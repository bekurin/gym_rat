import 'package:gym_rat/model/marker_event.dart';

List<dynamic> markerEventLoader(DateTime dateTime) {
  return [
    MarkerEvent(
      hasCompletedWorkout: true,
      hasWrittenMemo: false,
      hasEnteredBodyInfo: true,
    )
  ];
}
