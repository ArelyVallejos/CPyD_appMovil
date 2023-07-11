import 'package:cpyd/screens/authscreen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VoteAPI {
  static const String url = "https://api.sebastian.cl";

  static Dio get basicDio => Dio(
        BaseOptions(
          baseUrl: url,
          headers: {
            'Accept': 'application/json',
            "X-API-TOKEN": "GRUPO-K-CPYD",
            "X-API-KEY": "168f61c8e912458daec8733f466ccd20",
          },
        ),
      );

  static Dio get authDio =>
      basicDio..options.baseUrl = "$url/UtemAuth/v1/tokens";

  static Future<Dio> get voteDio async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jwt = prefs.getString('jwt');

    return Dio(
      BaseOptions(
        baseUrl: "$url/feeling/v1/voter",
        headers: {
          'Accept': 'application/json',
          'Authorization': "Bearer $jwt",
        },
      ),
    );
  }

  static Future<bool> login(context) async {
    var res = await VoteAPI.authDio.get('/login');

    if (res.statusCode != 200) {
      return false;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        // Vamos hacia la pantalla de autenticación.
        builder: (context) => AuthScreen(
          initialUrl: res.data['redirectUrl'],
          destinationUrl:
              "https://api.sebastian.cl/UtemAuth/v1/tokens/${res.data['token']}/exists",
        ),
      ),
    );

    return true;
  }
}
