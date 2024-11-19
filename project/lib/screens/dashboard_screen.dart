import 'package:flutter/material.dart';
import 'package:project/screens/home_screen.dart';
import 'package:project/screens/profile_Screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0; // Track the currently selected index

  // Screens to display for each tab
  final List<Widget> _screens = [
    Homescreen(),
    ProfileScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: _screens[_currentIndex], // Display the current screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Set the selected index
        onTap: (int index) {
          setState(() {
            _currentIndex = index; // Update the index on tap
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.label), label: "Label"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
