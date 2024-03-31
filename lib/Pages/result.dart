import 'package:flutter/material.dart';
import 'package:quiz_app_simple/Widgets/widget.dart';

class Result extends StatefulWidget {
  const Result({super.key});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.thumb_up,size: 100,color: greenColor,),
            wText('Hore Nilai Kamu', blueColor, 22, FontWeight.w500),
            wText('100', blueColor, 32, FontWeight.bold)
          ],
        ),
      )),
    );
  }
}