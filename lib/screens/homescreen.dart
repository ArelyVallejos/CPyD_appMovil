import 'package:cpyd/screens/aboutscreen.dart';
import 'package:cpyd/screens/coursesscreen.dart';
import 'package:cpyd/screens/votacionesscreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: "Bienvenido", home: BottomNavigator());
  }
}

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int currentIndex = 0;
  final screens = [
    const Center(child: CoursesScreen()),
    const Center(child: VotacionesScreen()),
    const Center(child: AboutScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Votaciones UTEM'),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        unselectedItemColor: Colors.white54,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Cursos",
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections_bookmark),
            label: "Resultados",
            backgroundColor: Colors.lightBlue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: "About",
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
