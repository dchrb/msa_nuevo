import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:myapp/data/exercise_list.dart';
import 'package:myapp/models/exercise.dart';
import 'package:uuid/uuid.dart';

class ExerciseProvider with ChangeNotifier {
  final Box<Exercise> _exerciseBox = Hive.box<Exercise>('exercises');
  final Uuid _uuid = const Uuid();

  List<Exercise> _exercises = [];
  List<Exercise> get exercises => _exercises;

  ExerciseProvider() {
    _loadExercises();
  }

  Future<void> _loadExercises() async {
    // This will add each exercise if it's new, or update it if the key already exists.
    // This ensures the local database is always in sync with the initial list.
    for (final exercise in initialExercises) {
      await _exerciseBox.put(exercise.id, exercise);
    }
    
    _exercises = _exerciseBox.values.toList();
    await _updateExistingExercises(); // Update existing exercises with new fields if necessary
    notifyListeners();
  }

  Future<void> _updateExistingExercises() async {
    final List<Future<void>> futures = [];
    for (final exercise in _exercises) {
      bool needsUpdate = false;
      Exercise updatedExercise = exercise;

      if (exercise.difficulty == null || exercise.difficulty!.isEmpty) {
        updatedExercise = Exercise(
          id: exercise.id,
          name: exercise.name,
          description: exercise.description,
          type: exercise.type,
          muscleGroup: exercise.muscleGroup,
          equipment: exercise.equipment,
          measurement: exercise.measurement,
          imageUrl: exercise.imageUrl,
          videoUrl: exercise.videoUrl,
          difficulty: 'Principiante',
          beginnerSets: exercise.beginnerSets,
          beginnerReps: exercise.beginnerReps,
          intermediateSets: exercise.intermediateSets,
          intermediateReps: exercise.intermediateReps,
          advancedSets: exercise.advancedSets,
          advancedReps: exercise.advancedReps,
          recommendations: exercise.recommendations,
        );
        needsUpdate = true;
      }

      if (exercise.recommendations == null || exercise.recommendations!.isEmpty) {
        updatedExercise = Exercise(
          id: updatedExercise.id,
          name: updatedExercise.name,
          description: updatedExercise.description,
          type: updatedExercise.type,
          muscleGroup: updatedExercise.muscleGroup,
          equipment: updatedExercise.equipment,
          measurement: updatedExercise.measurement,
          imageUrl: updatedExercise.imageUrl,
          videoUrl: updatedExercise.videoUrl,
          difficulty: updatedExercise.difficulty,
          beginnerSets: updatedExercise.beginnerSets,
          beginnerReps: updatedExercise.beginnerReps,
          intermediateSets: updatedExercise.intermediateSets,
          intermediateReps: updatedExercise.intermediateReps,
          advancedSets: updatedExercise.advancedReps,
          advancedReps: updatedExercise.advancedReps,
          recommendations: 'Sin recomendaciones específicas.',
        );
        needsUpdate = true;
      }

      if (needsUpdate) {
        futures.add(updateExercise(updatedExercise));
      }
    }
    if (futures.isNotEmpty) {
      await Future.wait(futures);
    }
  }

  Future<void> addExercise(Exercise exercise) async {
    final newExercise = Exercise(
      id: _uuid.v4(),
      name: exercise.name,
      description: exercise.description,
      type: exercise.type,
      muscleGroup: exercise.muscleGroup,
      equipment: exercise.equipment,
      measurement: exercise.measurement,
      imageUrl: exercise.imageUrl,
      videoUrl: exercise.videoUrl,
      difficulty: exercise.difficulty,
      beginnerSets: exercise.beginnerSets,
      beginnerReps: exercise.beginnerReps,
      intermediateSets: exercise.intermediateSets,
      intermediateReps: exercise.intermediateReps,
      advancedSets: exercise.advancedSets,
      advancedReps: exercise.advancedReps,
      recommendations: exercise.recommendations,
    );
    await _exerciseBox.put(newExercise.id, newExercise);
    _exercises.add(newExercise);
    notifyListeners();
  }

  Future<void> updateExercise(Exercise exercise) async {
    await _exerciseBox.put(exercise.id, exercise);
    final index = _exercises.indexWhere((e) => e.id == exercise.id);
    if (index != -1) {
      _exercises[index] = exercise;
      notifyListeners();
    }
  }

  Future<void> deleteExercise(String id) async {
    await _exerciseBox.delete(id);
    _exercises.removeWhere((e) => e.id == id);
    notifyListeners();
  }

  // Method to get a single exercise by its ID
  Exercise? getExerciseById(String id) {
    try {
      return _exercises.firstWhere((exercise) => exercise.id == id);
    } catch (e) {
      // If no element is found, firstWhere throws a StateError.
      // We catch it and return null for safety.
      return null;
    }
  }
}
