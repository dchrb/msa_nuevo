import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp/models/food_log.dart';

class FoodLogScreen extends StatefulWidget {
  final Function(FoodLog) onAddFoodLog;

  const FoodLogScreen({super.key, required this.onAddFoodLog});

  @override
  State<FoodLogScreen> createState() => _FoodLogScreenState();
}

class _FoodLogScreenState extends State<FoodLogScreen> {
  final _formKey = GlobalKey<FormState>();
  final _foodNameController = TextEditingController();
  final _caloriesController = TextEditingController();
  final _proteinController = TextEditingController();
  final _carbohydratesController = TextEditingController();
  final _fatController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _selectedMealType = 'Desayuno';

  final List<String> _mealTypes = [
    'Desayuno',
    'Almuerzo',
    'Cena',
    'Snack (Mañana)',
    'Snack (Tarde)',
    'Snack (Noche)',
    'Otro',
  ];

  @override
  void dispose() {
    _foodNameController.dispose();
    _caloriesController.dispose();
    _proteinController.dispose();
    _carbohydratesController.dispose();
    _fatController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final newFoodLog = FoodLog(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        foodName: _foodNameController.text,
        calories: double.tryParse(_caloriesController.text) ?? 0.0,
        protein: double.tryParse(_proteinController.text) ?? 0.0,
        carbohydrates: double.tryParse(_carbohydratesController.text) ?? 0.0,
        fat: double.tryParse(_fatController.text) ?? 0.0,
        date: _selectedDate,
        mealType: _selectedMealType,
      );
      widget.onAddFoodLog(newFoodLog);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Comida'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildTextField(_foodNameController, 'Nombre de la Comida'),
                _buildTextField(_caloriesController, 'Calorías', isNumber: true),
                _buildTextField(_proteinController, 'Proteínas (g)', isNumber: true),
                _buildTextField(_carbohydratesController, 'Carbohidratos (g)', isNumber: true),
                _buildTextField(_fatController, 'Grasas (g)', isNumber: true),
                const SizedBox(height: 24),
                _buildMealTypeDropdown(),
                const SizedBox(height: 20),
                _buildDatePicker(context),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: _submitForm,
                   style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  child: const Text('Guardar Registro'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, {bool isNumber = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        keyboardType: isNumber ? const TextInputType.numberWithOptions(decimal: true) : TextInputType.text,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Por favor, ingrese un valor';
          }
          if (isNumber && double.tryParse(value) == null) {
            return 'Por favor, ingrese un número válido';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildMealTypeDropdown() {
    return DropdownButtonFormField<String>(
      // Use `initialValue` to set the starting value of the form field.
      // When `setState` is called, the widget rebuilds, and this `initialValue`
      // is updated to reflect the current state of `_selectedMealType`.
      initialValue: _selectedMealType,
      decoration: InputDecoration(
        labelText: 'Tipo de Comida',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      items: _mealTypes.map((String type) {
        return DropdownMenuItem<String>(
          value: type,
          child: Text(type),
        );
      }).toList(),
      onChanged: (newValue) {
        if (newValue != null) {
          setState(() {
            _selectedMealType = newValue;
          });
        }
      },
    );
  }

  Widget _buildDatePicker(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Fecha: ${DateFormat.yMMMEd('es').format(_selectedDate)}',
              style: const TextStyle(fontSize: 16),
            ),
            TextButton(
              onPressed: () => _selectDate(context),
              child: const Text('Cambiar'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }
}
