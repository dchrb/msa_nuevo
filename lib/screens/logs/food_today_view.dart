import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:myapp/screens/menus/edit_meal_screen.dart';

class FoodTodayView extends StatefulWidget {
  const FoodTodayView({super.key});

  @override
  State<FoodTodayView> createState() => _FoodTodayViewState();
}

class _FoodTodayViewState extends State<FoodTodayView> {
  DateTime _selectedDate = DateTime.now();

  void _changeDate(int days) {
    setState(() {
      _selectedDate = _selectedDate.add(Duration(days: days));
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(icon: const Icon(Icons.chevron_left), onPressed: () => _changeDate(-1)),
                Text(DateFormat.yMMMd('es').format(_selectedDate), style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold)),
                IconButton(icon: const Icon(Icons.chevron_right), onPressed: DateUtils.isSameDay(_selectedDate, DateTime.now()) ? null : () => _changeDate(1)),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.edit_calendar_outlined, size: 80, color: Colors.grey[400]),
                    const SizedBox(height: 20),
                    Text(
                      'Registra tus comidas del día',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Usa el botón de abajo para añadir lo que has comido en el desayuno, almuerzo, cena o como snack.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(fontSize: 16, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _selectMealTypeAndEdit(context),
        label: const Text('Añadir Comida'),
        icon: const Icon(Icons.add),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _selectMealTypeAndEdit(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        final mealTypes = ['Desayuno', 'Almuerzo', 'Cena', 'Snacks'];
        final mealIcons = [Icons.free_breakfast, Icons.lunch_dining, Icons.dinner_dining, Icons.fastfood];

        return Wrap(
          children: List.generate(mealTypes.length, (index) {
            return ListTile(
              leading: Icon(mealIcons[index]),
              title: Text(mealTypes[index]),
              onTap: () {
                Navigator.pop(context); // Close the bottom sheet
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditMealScreen(mealType: mealTypes[index], date: _selectedDate),
                  ),
                );
              },
            );
          }),
        );
      },
    );
  }
}
