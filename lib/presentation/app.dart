import 'package:flutter/material.dart';
import 'package:prueba/presentation/screens/screens.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter First App',
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
        ),
        initialRoute: HomeScreen.routeName,
        routes: {
          // ignore: prefer_const_constructors
          HomeScreen.routeName: (_) => HomeScreen(),
          NewUserScreen.routeName: (_) => const NewUserScreen(),
        });
  }
}
