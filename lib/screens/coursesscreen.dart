import 'package:cpyd/models/course.dart';
import 'package:cpyd/screens/emitvotescreen.dart';
import 'package:flutter/material.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  late Future<List<Course>> courses;

  @override
  void initState() {
    super.initState();
    courses = Course.fetchCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: courses,
        builder: (BuildContext context, AsyncSnapshot<List<Course>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) =>
                    CourseListTile(course: snapshot.data![index]));
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class CourseListTile extends StatelessWidget {
  const CourseListTile({
    Key? key,
    required this.course,
  }) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
      ),
      child: Card(
        child: InkWell(
          onTap: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EmitVoteScreen(
                  course: course,
                ),
              ),
            )
          },
          child: Container(
            padding: const EdgeInsets.all(40),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                ),
                Container(height: 10),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(course.code),
                    Text(course.year.toString()),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
