// lib/models/workout_session.dart
import 'package:uuid/uuid.dart';
import 'package:myapp/models/set_log.dart'; // Importa la clase correcta

// Representa todas las series registradas para un solo ejercicio dentro de una sesión de entrenamiento.
class PerformedExerciseLog {
  final String exerciseName;
  final List<SetLog> sets;

  PerformedExerciseLog({required this.exerciseName, required this.sets});
}

// Representa una sesión de entrenamiento completa que ha sido finalizada y registrada.
class WorkoutSession {
  final String id;
  final String routineName;
  final DateTime date;
  final List<PerformedExerciseLog> performedExercises;

  WorkoutSession({
    required this.routineName,
    required this.date,
    required this.performedExercises,
    String? id, // El ID es ahora opcional en el constructor
  }) : id = id ?? const Uuid().v4(); // Genera un ID v4 si no se proporciona uno
}
