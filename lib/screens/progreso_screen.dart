
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:myapp/models/body_measurement.dart';
import 'package:myapp/models/routine_log.dart';
import 'package:myapp/models/water_log.dart';
import 'package:myapp/widgets/ui/watermark_image.dart';

class ProgresoScreen extends StatelessWidget {
  const ProgresoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const WatermarkImage(imageName: 'progreso'),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('Tu Progreso', style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onPrimaryContainer)),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildWeightProgressCard(),
                const SizedBox(height: 24),
                _buildWorkoutSummaryCard(),
                const SizedBox(height: 24),
                _buildWaterIntakeCard(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWaterIntakeCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Consumo de Agua (Últimos 7 Días)', style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            SizedBox(
              height: 150,
              child: ValueListenableBuilder(
                valueListenable: Hive.box<WaterLog>('water_logs').listenable(),
                builder: (context, Box<WaterLog> box, _) {
                  final today = DateTime.now();
                  final recentDays = List.generate(7, (index) => today.subtract(Duration(days: index))).reversed.toList();
                  final dailyTotals = recentDays.map((day) {
                    final logsOnDay = box.values.where((log) =>
                        log.timestamp.year == day.year &&
                        log.timestamp.month == day.month &&
                        log.timestamp.day == day.day);
                    return logsOnDay.fold<double>(0, (sum, log) => sum + log.amount);
                  }).toList();

                  if (dailyTotals.every((total) => total == 0)) {
                    return const Center(child: Text('No hay datos de consumo de agua.'));
                  }

                  return BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceAround,
                      maxY: dailyTotals.reduce((a, b) => a > b ? a : b) + 500,
                      barGroups: recentDays.asMap().entries.map((entry) {
                        final index = entry.key;
                        final day = entry.value;
                        return BarChartGroupData(
                          x: index,
                          barRods: [
                            BarChartRodData(
                              toY: dailyTotals[index],
                              color: Theme.of(context).colorScheme.secondary,
                              width: 15,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ],
                        );
                      }).toList(),
                      titlesData: FlTitlesData(
                        leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 30,
                            getTitlesWidget: (value, meta) {
                              final index = value.toInt();
                              if (index >= 0 && index < recentDays.length) {
                                final date = recentDays[index];
                                return Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text('${date.day}/${date.month}', style: const TextStyle(fontSize: 10)),
                                );
                              }
                              return const Text('');
                            },
                          ),
                        ),
                      ),
                      gridData: const FlGridData(show: false),
                      borderData: FlBorderData(show: false),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeightProgressCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Progreso de Peso (Últimos 7 Días)', style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            SizedBox(
              height: 150,
              child: ValueListenableBuilder(
                valueListenable: Hive.box<BodyMeasurement>('body_measurements').listenable(),
                builder: (context, Box<BodyMeasurement> box, _) {
                  if (box.values.length < 2) {
                    return const Center(child: Text('No hay suficientes datos para mostrar el progreso.'));
                  }

                  final measurements = box.values.toList()..sort((a, b) => a.timestamp.compareTo(b.timestamp));
                  final recentMeasurements = measurements.length > 7 ? measurements.sublist(measurements.length - 7) : measurements;

                  return BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceAround,
                      maxY: recentMeasurements.map((m) => m.weight ?? 0).reduce((a, b) => a > b ? a : b) + 5,
                      minY: recentMeasurements.map((m) => m.weight ?? 0).reduce((a, b) => a < b ? a : b) - 5,
                      barGroups: recentMeasurements.asMap().entries.map((entry) {
                        final index = entry.key;
                        final measurement = entry.value;
                        return BarChartGroupData(
                          x: index,
                          barRods: [
                            BarChartRodData(
                              toY: measurement.weight ?? 0,
                              color: Theme.of(context).colorScheme.primary,
                              width: 15,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ],
                        );
                      }).toList(),
                      titlesData: FlTitlesData(
                        leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 30,
                            getTitlesWidget: (value, meta) {
                              final index = value.toInt();
                              if (index >= 0 && index < recentMeasurements.length) {
                                final date = recentMeasurements[index].timestamp;
                                return Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text('${date.day}/${date.month}', style: const TextStyle(fontSize: 10)),
                                );
                              }
                              return const Text('');
                            },
                          ),
                        ),
                      ),
                      gridData: const FlGridData(show: false),
                      borderData: FlBorderData(show: false),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkoutSummaryCard() {
    String formatDuration(int totalMinutes) {
      final hours = totalMinutes ~/ 60;
      final minutes = totalMinutes % 60;
      return '${hours}h ${minutes}m';
    }

    return ValueListenableBuilder(
        valueListenable: Hive.box<RoutineLog>('routine_logs').listenable(),
        builder: (context, Box<RoutineLog> box, _) {
          final now = DateTime.now();
          final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
          final endOfWeek = startOfWeek.add(const Duration(days: 6));

          final weeklyLogs = box.values.where((log) {
            final logDate = log.date;
            return logDate.isAfter(startOfWeek.subtract(const Duration(days: 1))) &&
                   logDate.isBefore(endOfWeek.add(const Duration(days: 1)));
          }).toList();

          final workoutsThisWeek = weeklyLogs.length;
          final totalMinutes = weeklyLogs.fold<int>(0, (sum, log) => sum + (log.duration?.inMinutes ?? 0));
          final timeSpent = formatDuration(totalMinutes);

          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Resumen de Ejercicio Semanal', style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(workoutsThisWeek.toString(), style: GoogleFonts.montserrat(fontSize: 28, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary)),
                          Text('Entrenos esta semana', style: GoogleFonts.lato()),
                        ],
                      ),
                      Column(
                        children: [
                          Text(timeSpent, style: GoogleFonts.montserrat(fontSize: 28, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary)),
                          Text('Tiempo total', style: GoogleFonts.lato()),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
