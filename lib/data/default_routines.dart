
import 'package:hive/hive.dart';
import 'package:myapp/models/routine.dart';
import 'package:myapp/models/routine_exercise.dart';

void createDefaultRoutines() {
  final routineBox = Hive.box<Routine>('routines');
  final routineExerciseBox = Hive.box<RoutineExercise>('routine_exercises');

  // Clear all existing routines and exercises
  routineBox.clear();
  routineExerciseBox.clear();
}
