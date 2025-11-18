import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/providers/meal_plan_provider.dart';
import 'package:myapp/providers/theme_provider.dart';
import 'package:myapp/screens/menus/edit_meal_screen.dart';
import 'package:provider/provider.dart';

class TodayMenuScreen extends StatelessWidget {
  const TodayMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Consumer<MealPlanProvider>(
      builder: (context, mealPlanProvider, child) {
        final dailyMenu = mealPlanProvider.getPlanForDay(DateTime.now());
        final activeMealTypes = dailyMenu.keys.where((mealType) => dailyMenu[mealType]!.isNotEmpty).toList();

        if (activeMealTypes.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.restaurant_menu_outlined, size: 80, color: Colors.grey[400]),
                  const SizedBox(height: 20),
                  Text(
                    'Aún no has planificado tus comidas de hoy',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Usa el planificador semanal para añadir comidas y verlas aquí.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(fontSize: 16, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: activeMealTypes.length,
          itemBuilder: (context, index) {
            final mealType = activeMealTypes[index];
            final mealText = dailyMenu[mealType]!;

            return Card(
              elevation: 4,
              margin: const EdgeInsets.only(bottom: 16.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mealType,
                      style: GoogleFonts.montserrat(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: themeProvider.seedColor,
                      ),
                    ),
                    const Divider(height: 20, thickness: 1),
                    Text(
                      mealText,
                      style: GoogleFonts.lato(fontSize: 16, color: Colors.black87, height: 1.4),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton.icon(
                          icon: const Icon(Icons.edit_outlined, size: 20),
                          label: const Text('Editar Comida'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditMealScreen(mealType: mealType, date: DateTime.now()),
                              ),
                            );
                          },
                        ),
                      ],
                    )
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
