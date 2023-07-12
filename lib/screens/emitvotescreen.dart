import 'package:cpyd/models/course.dart';
import 'package:flutter/material.dart';

class EmitVoteScreen extends StatelessWidget {
  const EmitVoteScreen({Key? key, required this.course}) : super(key: key);
  final Course course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 80,
        title: const Text('   Votando'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 3, 204, 204),
            Color.fromARGB(255, 2, 129, 129)
          ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Text(course.name),
      ),
    );
  }
}
