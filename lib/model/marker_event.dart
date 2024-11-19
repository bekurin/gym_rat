class MarkerEvent {
  final bool hasCompletedWorkout;
  final bool hasWrittenMemo;
  final bool hasEnteredBodyInfo;
  MarkerEvent({
    required this.hasCompletedWorkout,
    required this.hasWrittenMemo,
    required this.hasEnteredBodyInfo,
  });
  bool hasNothing() {
    return (hasCompletedWorkout || hasWrittenMemo || hasEnteredBodyInfo) ==
        false;
  }

  int getTotalEvent() {
    return [
      hasCompletedWorkout,
      hasWrittenMemo,
      hasEnteredBodyInfo,
    ].where((condition) => condition).length;
  }
}
