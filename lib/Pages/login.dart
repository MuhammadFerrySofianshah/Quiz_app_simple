import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:quiz_app_simple/Models/qustion.dart';
import 'package:quiz_app_simple/Pages/test.dart';
import 'package:quiz_app_simple/Widgets/loading.dart';
import 'package:quiz_app_simple/Widgets/widget.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // controller
  final usernameController = TextEditingController();

  // get API
  late QuestionList questionList;
  late String username;

  // link API
  final String url =
      "https://script.google.com/macros/s/AKfycbyidRYVGYJVdj-sgCMY_1TyVxHnaD96xAcWZC5bmixRF539UoFJ65TH2E59HbuOshSB/exec";

  // eksekusi Data API nya
  Future<void> getAllData(String username) async {
    try {
      var responseAPI = await http.get(Uri.parse(url));
      questionList = QuestionList.fromJson(json.decode(responseAPI.body));
      wOff(
          context,
          (context) => Test(
                questionList: questionList,
                username: username,
              ));
    } catch (e, stackTrace) {
      print('error:$e\n$stackTrace');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/bg.jpg'), // Ganti dengan path gambar Anda
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              wText('Quiz Kuyyy!', blueColor, 32, FontWeight.bold),
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(
                  hintText: 'Name',
                ),
              ),
              wSizedBoxHeight(20),
              ElevatedButton(
                onPressed: () {
                  getAllData(
                    usernameController.text,
                  );
                },
                child: wText('M U L A I', blueColor, 16, FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
