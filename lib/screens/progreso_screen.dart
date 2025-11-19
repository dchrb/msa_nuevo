
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:myapp/models/body_measurement.dart';
import 'package:myapp/models/routine_log.dart';
import 'package:myapp/models/water_log.dart';
import 'package:myapp/widgets/ui/watermark_image.dart';

class ProgresoScreen extends StatefulWidget {
  const ProgresoScreen({super.key});

  @override
  State<ProgresoScreen> createState() => _ProgresoScreenState();
}

class _ProgresoScreenState extends State<ProgresoScreen> {
  String _selectedPeriod = 'Últimos 7 Días';

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
                _buildDateFilter(),
                const SizedBox(height: 24),
                _buildWeightProgressCard(),
                const SizedBox(height: 24),
                _buildBodyMeasurementCard(),
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

    Widget _buildBodyMeasurementCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Medidas Corporales ($_selectedPeriod)', style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: ValueListenableBuilder(
                valueListenable: Hive.box<BodyMeasurement>('body_measurements').listenable(),
                builder: (context, Box<BodyMeasurement> box, _) {
                   final now = DateTime.now();
                  DateTime startDate;
                  switch (_selectedPeriod) {
                    case 'Último Mes':
                      startDate = now.subtract(const Duration(days: 30));
                      break;
                    case 'Último Año':
                      startDate = now.subtract(const Duration(days: 365));
                      break;
                    default:
                      startDate = now.subtract(const Duration(days: 7));
                  }

                  final measurements = box.values.where((m) => m.timestamp.isAfter(startDate)).toList()
                    ..sort((a, b) => a.timestamp.compareTo(b.timestamp));

                  if (measurements.length < 2) {
                    return const Center(child: Text('No hay suficientes datos de medidas corporales.'));
                  }

                  final first = measurements.first;
                  final last = measurements.last;

                  final data = [
                    last.chest ?? 0,
                    last.arm ?? 0,
                    last.waist ?? 0,
                    last.hips ?? 0,
                    last.thigh ?? 0,
                  ];

                  final initialData = [
                    first.chest ?? 0,
                    first.arm ?? 0,
                    first.waist ?? 0,
                    first.hips ?? 0,
                    first.thigh ?? 0,
                  ];


                  return RadarChart(
                    RadarChartData(
                      dataSets: [
                        RadarDataSet(
                          dataEntries: initialData.map((d) => RadarEntry(value: d)).toList(),
                          borderColor: Colors.grey,
                          borderWidth: 1,
                        ),
                        RadarDataSet(
                          dataEntries: data.map((d) => RadarEntry(value: d)).toList(),
                          borderColor: Theme.of(context).colorScheme.primary,
                          fillColor: Theme.of(context).colorScheme.primary.withAlpha(100),
                          borderWidth: 2,
                        ),
                      ],
                      tickCount: 5,
                      ticksTextStyle: const TextStyle(color: Colors.transparent, fontSize: 10),
                      getTitle: (index, angle) {
                        final titles = ['Pecho', 'Brazo', 'Cintura', 'Cadera', 'Muslo'];
                        return RadarChartTitle(text: titles[index], angle: angle);
                      },
                      gridBorderData: const BorderSide(color: Colors.grey, width: 1),
                      radarShape: RadarShape.circle,
                      radarBackgroundColor: Colors.transparent,
                      borderData: FlBorderData(show: false),
                      radarBorderData: const BorderSide(color: Colors.transparent),
                      tickBorderData: const BorderSide(color: Colors.transparent),
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

  Widget _buildDateFilter() {
    final periods = ['Últimos 7 Días', 'Último Mes', 'Último Año'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: periods.map((period) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: ChoiceChip(
            label: Text(period),
            selected: _selectedPeriod == period,
            onSelected: (selected) {
              if (selected) {
                setState(() {
                  _selectedPeriod = period;
                });
              }
            },
          ),
        );
      }).toList(),
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
            Text('Consumo de Agua ($_selectedPeriod)', style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            SizedBox(
              height: 150,
              child: ValueListenableBuilder(
                valueListenable: Hive.box<WaterLog>('water_logs').listenable(),
                builder: (context, Box<WaterLog> box, _) {
                  final now = DateTime.now();
                  DateTime startDate;
                  switch (_selectedPeriod) {
                    case 'Último Mes':
                      startDate = now.subtract(const Duration(days: 30));
                      break;
                    case 'Último Año':
                      startDate = now.subtract(const Duration(days: 365));
                      break;
                    default:
                      startDate = now.subtract(const Duration(days: 7));
                  }

                  final logs = box.values.where((log) => log.timestamp.isAfter(startDate)).toList();
                  
                  if (logs.isEmpty) {
                    return const Center(child: Text('No hay datos de consumo de agua.'));
                  }

                  final dailyTotals = <DateTime, double>{};
                  for (var log in logs) {
                    final day = DateTime(log.timestamp.year, log.timestamp.month, log.timestamp.day);
                    dailyTotals[day] = (dailyTotals[day] ?? 0) + log.amount;
                  }
                  
                  final chartData = dailyTotals.entries.toList()..sort((a,b) => a.key.compareTo(b.key));

                  return BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceAround,
                      maxY: chartData.map((e) => e.value).reduce((a,b) => a > b ? a : b) + 500,
                      barGroups: chartData.asMap().entries.map((entry) {
                        final index = entry.key;
                        final data = entry.value;
                        return BarChartGroupData(
                          x: index,
                          barRods: [
                            BarChartRodData(
                              toY: data.value,
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
                              if (index >= 0 && index < chartData.length) {
                                final date = chartData[index].key;
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
            Text('Progreso de Peso ($_selectedPeriod)', style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            SizedBox(
              height: 150,
              child: ValueListenableBuilder(
                valueListenable: Hive.box<BodyMeasurement>('body_measurements').listenable(),
                builder: (context, Box<BodyMeasurement> box, _) {
                  final now = DateTime.now();
                  DateTime startDate;
                  switch (_selectedPeriod) {
                    case 'Último Mes':
                      startDate = now.subtract(const Duration(days: 30));
                      break;
                    case 'Último Año':
                      startDate = now.subtract(const Duration(days: 365));
                      break;
                    default:
                      startDate = now.subtract(const Duration(days: 7));
                  }

                  final measurements = box.values.where((m) => m.timestamp.isAfter(startDate)).toList()
                    ..sort((a, b) => a.timestamp.compareTo(b.timestamp));

                  if (measurements.length < 2) {
                    return const Center(child: Text('No hay suficientes datos para mostrar el progreso.'));
                  }

                  return LineChart(
                    LineChartData(
                      gridData: const FlGridData(show: false),
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
                              if (index >= 0 && index < measurements.length) {
                                final date = measurements[index].timestamp;
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
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        LineChartBarData(
                           spots: measurements.asMap().entries.map((e) => FlSpot(e.key.toDouble(), e.value.weight ?? 0)).toList(),
                          isCurved: true,
                          color: Theme.of(context).colorScheme.primary,
                          barWidth: 4,
                          isStrokeCapRound: true,
                          dotData: const FlDotData(show: true),
                          belowBarData: BarAreaData(show: true, color: Theme.of(context).colorScheme.primary.withAlpha(100)),
                        ),
                      ],
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
          DateTime startDate;
          String periodText;
          switch (_selectedPeriod) {
            case 'Último Mes':
              startDate = now.subtract(const Duration(days: 30));
              periodText = 'en el último mes';
              break;
            case 'Último Año':
              startDate = now.subtract(const Duration(days: 365));
               periodText = 'en el último año';
              break;
            default:
              startDate = now.subtract(const Duration(days: 7));
              periodText = 'en los últimos 7 días';
          }

          final weeklyLogs = box.values.where((log) => log.date.isAfter(startDate)).toList();

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
                  Text('Resumen de Ejercicio ($periodText)', style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(workoutsThisWeek.toString(), style: GoogleFonts.montserrat(fontSize: 28, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary)),
                          const Text('Entrenamientos'),
                        ],
                      ),
                      Column(
                        children: [
                          Text(timeSpent, style: GoogleFonts.montserrat(fontSize: 28, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary)),
                          const Text('Tiempo total'),
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
