import 'package:flutter/material.dart';
import 'package:quiz_app_simple/Pages/login.dart';
import 'package:quiz_app_simple/Widgets/widget.dart';

class Result extends StatefulWidget {
  final int vResult;
  const Result({Key? key, required this.vResult}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              wSizedBoxHeight(200),
              Icon(
                Icons.check_circle_outline,
                size: 100,
                color: greenColor,
              ),
              wText('Nilai Kamu:', blueColor, 22, FontWeight.w500),
              wText(widget.vResult.toString(), blueColor, 32, FontWeight.bold),
              const Spacer(),
              TextButton(
                onPressed: () {
                  wOff(context, (context) => const Login());
                },
                child: wText('Back To Login', blueColor, 16, FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
