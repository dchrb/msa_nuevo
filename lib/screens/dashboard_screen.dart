
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/models/food_log.dart';
import 'package:myapp/models/water_log.dart';
import 'package:myapp/models/routine_log.dart';
import 'package:provider/provider.dart';
import 'package:myapp/providers/user_provider.dart';
import 'package:myapp/widgets/ui/watermark_image.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const WatermarkImage(imageName: 'inicio'),
        SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildWelcomeHeader(context),
              const SizedBox(height: 24),
              _buildDailyProgressRings(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWelcomeHeader(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        final user = userProvider.user;

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer.withAlpha((255 * 0.3).round()),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white70,
                backgroundImage: (user?.profileImageBytes != null)
                    ? MemoryImage(user!.profileImageBytes!)
                    : null,
                child: (user?.profileImageBytes == null)
                    ? const Icon(Icons.person, size: 40, color: Colors.grey)
                    : null,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user?.name ?? 'Invitado',
                      style: GoogleFonts.montserrat(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onPrimaryContainer),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Aquí está tu progreso de hoy',
                      style: GoogleFonts.lato(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.onPrimaryContainer.withAlpha((255 * 0.8).round())),
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDailyProgressRings() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Progreso Diario', style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCaloriesRing(),
                _buildWaterRing(),
                _buildTrainingRing(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCaloriesRing() {
    return ValueListenableBuilder(
      valueListenable: Hive.box<FoodLog>('food_logs').listenable(),
      builder: (context, Box<FoodLog> box, _) {
        final now = DateTime.now();
        bool isSameDay(DateTime d1, DateTime d2) {
          return d1.year == d2.year && d1.month == d2.month && d1.day == d2.day;
        }

        final dailyLogs = box.values.where((log) => isSameDay(log.date, now));
        final totalCalories = dailyLogs.fold<double>(0, (sum, log) => sum + log.calories);
        const caloricGoal = 2000;
        final percent = (totalCalories / caloricGoal).clamp(0.0, 1.0);

        return CircularPercentIndicator(
          radius: 50.0,
          lineWidth: 10.0,
          percent: percent,
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.local_fire_department, color: Colors.orange, size: 30),
              Text(
                '${totalCalories.toInt()} kcal',
                style: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          progressColor: Colors.orange,
          backgroundColor: Colors.orange.shade100,
          circularStrokeCap: CircularStrokeCap.round,
        );
      },
    );
  }

  Widget _buildWaterRing() {
    return ValueListenableBuilder(
      valueListenable: Hive.box<WaterLog>('water_logs').listenable(),
      builder: (context, Box<WaterLog> box, _) {
        final now = DateTime.now();
        bool isSameDay(DateTime d1, DateTime d2) {
          return d1.year == d2.year && d1.month == d2.month && d1.day == d2.day;
        }

        final dailyLogs = box.values.where((log) => isSameDay(log.timestamp, now));
        final totalWater = dailyLogs.fold<double>(0, (sum, log) => sum + log.amount);
        const waterGoal = 2000; // in ml
        final percent = (totalWater / waterGoal).clamp(0.0, 1.0);

        return CircularPercentIndicator(
          radius: 50.0,
          lineWidth: 10.0,
          percent: percent,
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.water_drop, color: Colors.blue, size: 30),
              Text(
                '${totalWater.toInt()} ml',
                style: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.bold),
                 textAlign: TextAlign.center,
              ),
            ],
          ),
          progressColor: Colors.blue,
          backgroundColor: Colors.blue.shade100,
          circularStrokeCap: CircularStrokeCap.round,
        );
      },
    );
  }

  Widget _buildTrainingRing() {
    return ValueListenableBuilder(
      valueListenable: Hive.box<RoutineLog>('routine_logs').listenable(),
      builder: (context, Box<RoutineLog> box, _) {
        final now = DateTime.now();
        bool isSameDay(DateTime d1, DateTime d2) {
          return d1.year == d2.year && d1.month == d2.month && d1.day == d2.day;
        }

        final trainedToday = box.values.any((log) => isSameDay(log.date, now));
        final percent = trainedToday ? 1.0 : 0.0;

        return CircularPercentIndicator(
          radius: 50.0,
          lineWidth: 10.0,
          percent: percent,
          center: Column(
             mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.fitness_center, color: Colors.green, size: 30),
               Text(
                trainedToday ? '¡Hecho!' : 'Pendiente',
                style: GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          progressColor: Colors.green,
          backgroundColor: Colors.green.shade100,
          circularStrokeCap: CircularStrokeCap.round,
        );
      },
    );
  }
}
