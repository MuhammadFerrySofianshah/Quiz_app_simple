import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app_simple/Models/qustion.dart';
import 'package:quiz_app_simple/Pages/result.dart';
import 'package:quiz_app_simple/Widgets/widget.dart';

class Test extends StatefulWidget {
  final QuestionList questionList;
  final String username;
  const Test({Key? key, required this.questionList, required this.username})
      : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  // controller
  final _countDownController = CountDownController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg-test.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    wText('1/${widget.questionList.data.length}', whiteColor, 16, FontWeight.normal),
                    wText(widget.username, whiteColor, 16, FontWeight.normal),
                  ],
                ),
                SizedBox(
                  height: 150,
                  width: 150,
                  child: CountDownProgressIndicator(
                    controller: _countDownController,
                    valueColor: blueColor,
                    backgroundColor: whiteColor,
                    initialPosition: 0,
                    duration: 60,
                    text: 'Second',
                    timeTextStyle: TextStyle(color: whiteColor, fontSize: 16),
                    labelTextStyle: TextStyle(color: whiteColor, fontSize: 16),
                    onComplete: () => null,
                  ),
                ),
                wSizedBoxHeight(50),
                wText('Apa yang dimaksud dengan cara bermain...', whiteColor,
                    22, FontWeight.normal),
                wSizedBoxHeight(20),
                _optionsWidget(
                    optionChar: 'A',
                    optionDetail: 'Warna Biru',
                    color: orangeColor),
                wSizedBoxHeight(20),
                _optionsWidget(
                    optionChar: 'B',
                    optionDetail: 'Warna Biru',
                    color: greenColor),
                wSizedBoxHeight(20),
                _optionsWidget(
                    optionChar: 'C',
                    optionDetail: 'Warna Biru',
                    color: blueColor),
                wSizedBoxHeight(20),
                _optionsWidget(
                    optionChar: 'D',
                    optionDetail: 'Warna Biru',
                    color: yellowColor),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _optionsWidget extends StatelessWidget {
  final String optionChar;
  final String optionDetail;
  final Color color;
  const _optionsWidget({
    required this.optionChar,
    required this.optionDetail,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        wOff(context, (context) => const Result());
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: color),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              wText(optionChar, whiteColor, 16, FontWeight.normal),
              wSizedBoxWidth(5),
              wText(optionDetail, whiteColor, 16, FontWeight.normal),
            ],
          ),
        ),
      ),
    );
  }
}
