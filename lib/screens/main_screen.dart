
import 'package:flutter/material.dart';
import 'package:myapp/screens/dashboard_screen.dart';
import 'package:myapp/screens/logs_screen.dart'; // Import the unified logs screen
import 'package:myapp/screens/progreso_screen.dart';
import 'package:myapp/widgets/drawer_menu.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    // When the 'Nutrición' tab is tapped, we navigate to the LogsScreen.
    // We don't change the selected index for the bottom bar itself,
    // as the main content area will be replaced by the LogsScreen.
    if (index == 1) {
      Navigator.of(context).push(
        MaterialPageRoute(
          // Navigate to LogsScreen, opening the 'Comida' tab.
          builder: (context) => const LogsScreen(initialTabIndex: 1),
        ),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  // Only two widgets are managed by this screen's state now.
  static const List<Widget> _widgetOptions = <Widget>[
    DashboardScreen(),
    // The LogsScreen is handled by the navigation logic above.
    ProgresoScreen(),
  ];

  // Corresponding titles.
  static const List<String> _appBarTitles = <String>[
    'Salud Activa',
    'Progreso',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Adjust the title based on the selected index.
        title: Text(_appBarTitles[_selectedIndex]),
      ),
      drawer: const DrawerMenu(),
      // Use a simple IndexedStack for the remaining two main screens.
      body: IndexedStack(
        // The index must now map correctly to the smaller list.
        index: _selectedIndex > 1 ? 1 : _selectedIndex,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu_outlined),
            activeIcon: Icon(Icons.restaurant_menu),
            label: 'Nutrición',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart_outlined),
            activeIcon: Icon(Icons.show_chart),
            label: 'Progreso',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
