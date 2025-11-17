
import 'package:hive/hive.dart';
import 'package:myapp/models/routine.dart';
import 'package:myapp/models/routine_exercise.dart';

void createDefaultRoutines() {
  final routineBox = Hive.box<Routine>('routines');

  // Check if routines with the new day-based naming exist to avoid duplication
  if (routineBox.values.any((r) => r.name.contains(' (Día '))) {
    return;
  }
  
  // Clear old routines if they exist to replace them with the new format
  routineBox.values
      .where((r) => r.name.startsWith("Semana 1:"))
      .forEach((r) => r.delete());

  final routineExerciseBox = Hive.box<RoutineExercise>('routine_exercises');

  // --- Rutina Lunes: Cuerpo Completo A ---
  final routineA = Routine(
    id: 'default_routine_day_1',
    name: 'Lunes (Día 1): Cuerpo Completo A',
    description: 'Rutina de fuerza enfocada en todo el cuerpo. Ideal para empezar la semana.',
  );
  final exercisesA = <RoutineExercise>[
    RoutineExercise(exerciseId: 'ex030', sets: 3, reps: '12-15'), // Sentadilla
    RoutineExercise(exerciseId: 'ex005', sets: 3, reps: 'Máximas (con rodillas)'), // Flexiones
    RoutineExercise(exerciseId: 'ex018', sets: 3, reps: '15 (Supermans)'), // Hiperextensiones
    RoutineExercise(exerciseId: 'ex051', sets: 3, reps: '30 seg'), // Plancha
  ];
  routineExerciseBox.addAll(exercisesA);
  routineA.exercises = HiveList(routineExerciseBox)..addAll(exercisesA);
  routineBox.put(routineA.id, routineA);

  // --- Rutina Miércoles: Cuerpo Completo B ---
  final routineB = Routine(
    id: 'default_routine_day_3',
    name: 'Miércoles (Día 3): Cuerpo Completo B',
    description: 'Segunda rutina de fuerza, trabajando músculos desde diferentes ángulos.',
  );
  final exercisesB = <RoutineExercise>[
    RoutineExercise(exerciseId: 'ex023', sets: 3, reps: '10-12 c/pierna'), // Zancadas
    RoutineExercise(exerciseId: 'ex048', sets: 3, reps: '10-12 (en silla)'), // Fondos de Tríceps
    RoutineExercise(exerciseId: 'ex058', sets: 3, reps: '10 c/lado (lento)'), // Bicho Muerto
    RoutineExercise(exerciseId: 'ex057', sets: 3, reps: '20-30 seg c/lado'), // Plancha Lateral
  ];
  routineExerciseBox.addAll(exercisesB);
  routineB.exercises = HiveList(routineExerciseBox)..addAll(exercisesB);
  routineBox.put(routineB.id, routineB);
  
  // --- Rutina Viernes: Cuerpo Completo A (Repetición) ---
  final routineA2 = Routine(
    id: 'default_routine_day_5',
    name: 'Viernes (Día 5): Cuerpo Completo A',
    description: 'Repetimos la rutina del lunes para reforzar el progreso.',
  );
  // Re-using the same exercises from routine A
  final exercisesA2 = <RoutineExercise>[
    RoutineExercise(exerciseId: 'ex030', sets: 3, reps: '12-15'), // Sentadilla
    RoutineExercise(exerciseId: 'ex005', sets: 3, reps: 'Máximas (con rodillas)'), // Flexiones
    RoutineExercise(exerciseId: 'ex018', sets: 3, reps: '15 (Supermans)'), // Hiperextensiones
    RoutineExercise(exerciseId: 'ex051', sets: 3, reps: '30 seg'), // Plancha
  ];
  routineExerciseBox.addAll(exercisesA2);
  routineA2.exercises = HiveList(routineExerciseBox)..addAll(exercisesA2);
  routineBox.put(routineA2.id, routineA2);


  // --- Rutina Sábado: Cardio y Core ---
  final routineC = Routine(
    id: 'default_routine_day_6',
    name: 'Sábado (Día 6): Cardio y Core',
    description: 'Rutina para elevar el ritmo cardíaco y fortalecer la zona media.',
  );
  final exercisesC = <RoutineExercise>[
    RoutineExercise(exerciseId: 'ex059', sets: 4, reps: '30 seg (descansa 30s)'), // Escaladores
    RoutineExercise(exerciseId: 'ex055', sets: 3, reps: '15 c/lado (pies apoyados)'), // Giros Rusos
  ];
  routineExerciseBox.addAll(exercisesC);
  routineC.exercises = HiveList(routineExerciseBox)..addAll(exercisesC);
  routineBox.put(routineC.id, routineC);
}
