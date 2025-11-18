
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:myapp/models/food_log.dart';
import 'package:myapp/screens/food/food_log_screen.dart';

class FoodLogListView extends StatelessWidget {
  const FoodLogListView({super.key});

  void _addFoodLog(BuildContext context, FoodLog log) {
    final foodLogBox = Hive.box<FoodLog>('food_logs');
    foodLogBox.put(log.id, log);
  }

  void _navigateToLogScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FoodLogScreen(
          onAddFoodLog: (log) => _addFoodLog(context, log),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<FoodLog>('food_logs').listenable(),
      builder: (context, Box<FoodLog> box, _) {
        final logs = box.values.toList();
        if (logs.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.no_food, size: 80, color: Colors.grey),
                const SizedBox(height: 20),
                Text(
                  'No hay comidas registradas.',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  onPressed: () => _navigateToLogScreen(context),
                  child: const Text('Registrar mi primera comida'),
                ),
              ],
            ),
          );
        }

        final sortedLogs = logs..sort((a, b) => b.date.compareTo(a.date));

        return ListView.builder(
          itemCount: sortedLogs.length,
          itemBuilder: (context, index) {
            final log = sortedLogs[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                title: Text(
                  log.foodName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${log.calories.toStringAsFixed(0)} kcal - ${log.mealType}'),
                    Text(DateFormat.yMMMEd('es').add_jm().format(log.date)),
                  ],
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('P: ${log.protein.toStringAsFixed(1)}g'),
                    Text('C: ${log.carbohydrates.toStringAsFixed(1)}g'),
                    Text('G: ${log.fat.toStringAsFixed(1)}g'),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
