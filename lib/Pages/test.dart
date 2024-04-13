import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app_simple/Models/qustion.dart';
import 'package:quiz_app_simple/Pages/result.dart';
import 'package:quiz_app_simple/Widgets/widget.dart';

class Test extends StatefulWidget {
  final QuestionList vQuestionList;
  final String vUsername;
  const Test({Key? key, required this.vQuestionList, required this.vUsername})
      : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  // controller
  final _countDownController = CountDownController();

  // yang berawalan 'v' adalah variabel
  int vIndex = 0;
  int vResult = 0;

  // logic
  void indexTambah(String vOptionHuruf) {
    setState(() {
      if (vOptionHuruf == (widget.vQuestionList.data[vIndex].correctOption)) {
        vResult++;
      }
      vIndex++;

      // ketika soal udh sampai ke 10, akan pindah halaman
      if (vIndex == widget.vQuestionList.data.length) {
        wPush(
            context,
            (context) => Result(
                  vResult: vResult,
                ));
      }
    });
  }

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
                // urutan soal
                _numberQuestion(),

                // waktu
                _timer(context),
                wSizedBoxHeight(50),

                // pertanyaan
                wText(widget.vQuestionList.data[vIndex].question, whiteColor,
                    22, FontWeight.normal),
                wSizedBoxHeight(20),

                // pilihan ganda
                _optionA(),
                wSizedBoxHeight(20),
                _optionB(),
                wSizedBoxHeight(20),
                _optionC(),
                wSizedBoxHeight(20),
                _optionD(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _numberQuestion() {
    return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  wText(
                      '${widget.vQuestionList.data[vIndex].id}/${widget.vQuestionList.data.length}',
                      whiteColor,
                      16,
                      FontWeight.normal),
                  wText(widget.vUsername, whiteColor, 16, FontWeight.normal),
                ],
              );
  }

  SizedBox _timer(BuildContext context) {
    return SizedBox(
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
                  onComplete: () => wPush(
                      context,
                      (context) => Result(
                            vResult: vResult,
                          )),
                ),
              );
  }

  _optionsWidget _optionA() {
    return _optionsWidget(
                vOptionHuruf: 'A. ',
                vOptionDeskripsi:
                    widget.vQuestionList.data[vIndex].optionA.toString(),
                vColor: orangeColor,
                vButtonKlik: () {
                  indexTambah('a');
                },
              );
  }

  _optionsWidget _optionB() {
    return _optionsWidget(
                vOptionHuruf: 'B. ',
                vOptionDeskripsi:
                    widget.vQuestionList.data[vIndex].optionB.toString(),
                vColor: greenColor,
                vButtonKlik: () {
                  indexTambah('b');
                },
              );
  }

  _optionsWidget _optionC() {
    return _optionsWidget(
                vOptionHuruf: 'C. ',
                vOptionDeskripsi:
                    widget.vQuestionList.data[vIndex].optionC.toString(),
                vColor: blueColor,
                vButtonKlik: () {
                  indexTambah('c');
                },
              );
  }

  _optionsWidget _optionD() {
    return _optionsWidget(
                vOptionHuruf: 'D. ',
                vOptionDeskripsi:
                    widget.vQuestionList.data[vIndex].optionD.toString(),
                vColor: yellowColor,
                vButtonKlik: () {
                  indexTambah('d');
                },
              );
  }
}

// ignore: camel_case_types
class _optionsWidget extends StatelessWidget {
  final String vOptionHuruf;
  final String vOptionDeskripsi;
  final VoidCallback vButtonKlik;
  final Color vColor;
  const _optionsWidget({
    required this.vOptionHuruf,
    required this.vOptionDeskripsi,
    required this.vButtonKlik,
    required this.vColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: vButtonKlik,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: vColor),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              wText(vOptionHuruf, whiteColor, 16, FontWeight.normal),
              wSizedBoxWidth(5),
              wText(vOptionDeskripsi, whiteColor, 16, FontWeight.normal),
            ],
          ),
        ),
      ),
    );
  }
}
