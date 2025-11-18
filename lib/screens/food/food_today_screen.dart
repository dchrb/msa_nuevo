
import 'package:flutter/material.dart';
import 'package:myapp/models/food_log.dart';
import 'package:myapp/screens/food/food_log_screen.dart';

class FoodTodayScreen extends StatelessWidget {
  final Function(FoodLog) onAddFoodLog;

  const FoodTodayScreen({super.key, required this.onAddFoodLog});

  void _navigateToLogScreen(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FoodLogScreen(
          onAddFoodLog: onAddFoodLog,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // For now, this screen will have a simple layout.
    // We will add more widgets here to show today's summary (calories, macros),
    // and buttons to log water and body measurements.
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // This will be replaced with a summary card for today's intake
            const Text(
              'Resumen del día (próximamente)',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () => _navigateToLogScreen(context),
              icon: const Icon(Icons.add_box_rounded, size: 28),
              label: const Text('Registrar Comida'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            // We will add buttons for water and measurements here
          ],
        ),
      ),
    );
  }
}
