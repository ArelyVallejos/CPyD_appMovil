import 'package:cpyd/dio/dio.dart';

class Course {
  String token;
  String code;
  String name;
  int semester;
  int year;
  bool active;

  Course({
    required this.token,
    required this.code,
    required this.name,
    required this.semester,
    required this.year,
    required this.active,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      token: json['token'],
      code: json['code'],
      name: json['name'],
      semester: json['semester'],
      year: json['year'],
      active: json['active'],
    );
  }

  static Future<List<Course>> fetchCourses() async {
    var res = await VoteAPI.voteDio.then((value) => value.get("/courses"));

    if (res.statusCode != 200) {
      throw Exception(res.data['message']);
    }

    List<dynamic> list = List<dynamic>.from(res.data);
    return List<Course>.from(
      list.map((e) => Course.fromJson(e)).toList(),
    );
  }
}
