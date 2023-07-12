import 'package:cpyd/models/course.dart';
import 'package:flutter/material.dart';

class EmitVoteScreen extends StatelessWidget {
  const EmitVoteScreen({Key? key, required this.course}) : super(key: key);
  final Course course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Votando"),
      ),
      body: Center(
        child: Text(course.name),
      ),
    );
  }
}
