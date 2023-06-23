import 'package:flutter/material.dart';
import 'package:prueba/presentation/screens/screens.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromARGB(255, 255, 255, 255)),
          useMaterial3: true,
        ),
        initialRoute: HomeScreen.routeName,
        routes: {
          // ignore: prefer_const_constructors
          HomeScreen.routeName: (_) => HomeScreen(),
        });
  }
}
