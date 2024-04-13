// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app_simple/Models/qustion.dart';
import 'package:quiz_app_simple/Pages/test.dart';
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
  late QuestionList vQuestionList;
  late String vUsername;

  // cara pakai If Else
  Future<void> vGetQuestionList(BuildContext context) async {
    final vResponse = await http.get(Uri.parse(
        "https://script.google.com/macros/s/AKfycbyidRYVGYJVdj-sgCMY_1TyVxHnaD96xAcWZC5bmixRF539UoFJ65TH2E59HbuOshSB/exec"));

    if (vResponse.statusCode == 200) {
      String vUsername = usernameController.text;
      QuestionList vQuestionList = QuestionList.fromJson(
          jsonDecode(vResponse.body) as Map<String, dynamic>);
      wOff(
          context,
          (context) => Test(
                vUsername: vUsername,
                vQuestionList: vQuestionList,
              ));
    } else {
      throw Exception('Terjadi Error');
    }
  }

  // Future<void> vCheckInternet() async {
  //   var vConnectivityResult = await (Connectivity().checkConnectivity());
  //   if (vConnectivityResult == ConnectivityResult.none) {
  //     showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: wText('Error', Colors.redAccent, 18, FontWeight.bold),
  //           content: wText(
  //               'Not Connect Internet', blackColor, 16, FontWeight.normal),
  //         );
  //       },
  //     );
  //     print('di klik');
  //   } else {
  //     print('tidak bisa');
  //   }
  // }
  bool vActiveConnect = false;
  String T = "";
  Future<void> vCheckInternet() async {
    try {
      final vResultInternet = await InternetAddress.lookup('google.com');
      if (vResultInternet.isNotEmpty &&
          vResultInternet[0].rawAddress.isNotEmpty) {
        setState(() {
          vActiveConnect = true;
          T = "turn off the data and repress again";
        });
      }
    } on SocketException catch (_) {
      setState(
        () {
          vActiveConnect = false;
          T = "Turn On the data and repress again";
        },
      );
    }
  }
  @override
  void initState() {
    vCheckInternet();
    super.initState();
  }

  // cara pakai Try catch
  // final String vUrl =
  //     "https://script.google.com/macros/s/AKfycbyidRYVGYJVdj-sgCMY_1TyVxHnaD96xAcWZC5bmixRF539UoFJ65TH2E59HbuOshSB/exec";
  // void vGetQuestionList() async {
  //   try {
  //     var vResponseAPI = await http.get(Uri.parse(vUrl));
  //     vQuestionList = QuestionList.fromJson(json.decode(vResponseAPI.body));
  //     wOff(
  //         context,
  //         (context) => Test(
  //               vQuestionList: vQuestionList,
  //               vUsername: vUsername,
  //             ));
  //   } catch (e) {}
  // }

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
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
                onPressed: () async {
                  // getAllData(
                  //   usernameController.text,
                  // );
                  await vCheckInternet();
                  vGetQuestionList(context);
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
