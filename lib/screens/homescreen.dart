import 'package:cpyd/screens/aboutscreen.dart';
import 'package:cpyd/screens/coursesscreen.dart';
import 'package:cpyd/screens/votacionesscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
  int _currentIndex = 0;
  final screens = [
    const Center(child: CoursesScreen()),
    const Center(child: VotacionesScreen()),
    const Center(child: AboutScreen()),
  ];
  final colors = [
    const Color.fromARGB(255, 3, 204, 204),
    const Color.fromARGB(255, 8, 172, 172),
    const Color.fromARGB(255, 2, 129, 129),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 80,
        title: const Text('Votaciones UTEM'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 3, 204, 204),
            Color.fromARGB(255, 2, 129, 129)
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
        ),
        backgroundColor: colors[_currentIndex],
        leading: Container(
          padding: const EdgeInsets.all(5),
          child: Image.asset('lib/assets/Icons/logo.png'),
        ),
      ),
      body: screens[_currentIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.only(bottom: 10),
        child: GNav(
          color: colors[_currentIndex],
          tabBackgroundColor: colors[_currentIndex],
          selectedIndex: _currentIndex,
          tabBorderRadius: 10,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          onTabChange: (index) => {setState(() => _currentIndex = index)},
          tabs: const [
            GButton(
              icon: Icons.list_alt_rounded,
              text: " Lista Cursos",
              iconActiveColor: Colors.white,
              textColor: Colors.white,
            ),
            GButton(
              icon: Icons.search_rounded,
              text: " Resultados",
              iconActiveColor: Colors.white,
              textColor: Colors.white,
            ),
            GButton(
              icon: Icons.group,
              text: " About",
              iconActiveColor: Colors.white,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
