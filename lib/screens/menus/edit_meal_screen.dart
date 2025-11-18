import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/providers/meal_plan_provider.dart';
import 'package:provider/provider.dart';

class EditMealScreen extends StatefulWidget {
  final String mealType;
  final DateTime date;

  const EditMealScreen({super.key, required this.mealType, required this.date});

  @override
  State<EditMealScreen> createState() => _EditMealScreenState();
}

class _EditMealScreenState extends State<EditMealScreen> {
  late final TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    // Initialize the controller with the text from the provider
    final provider = Provider.of<MealPlanProvider>(context, listen: false);
    final mealText = provider.getMealTextForDay(widget.date, widget.mealType);
    _textController = TextEditingController(text: mealText);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar ${widget.mealType}', style: GoogleFonts.lato()),
        actions: [
          IconButton(
            icon: const Icon(Icons.save, color: Colors.white),
            tooltip: 'Guardar Cambios',
            onPressed: () {
              // Save the updated text to the provider
              Provider.of<MealPlanProvider>(context, listen: false).updateMealText(
                widget.date,
                widget.mealType,
                _textController.text,
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('¡Comida guardada!')),
              );
              Navigator.of(context).pop();
            },
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '¿Qué comiste?',
              style: GoogleFonts.montserrat(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              'Escribe aquí los alimentos que quieres registrar para el ${widget.mealType.toLowerCase()}. Puedes separar los alimentos con comas.',
              style: GoogleFonts.lato(fontSize: 16, color: Colors.grey[700]),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: TextFormField(
                controller: _textController,
                maxLines: null, // Allows for multiline input
                expands: true, // Expands to fill available space
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  hintText: 'Ej: Arroz, ensalada, carne guisada y agua...',
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                style: GoogleFonts.lato(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
