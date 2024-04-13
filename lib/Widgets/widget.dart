import 'package:flutter/material.dart';

Color orangeColor = const Color.fromARGB(255, 255, 136, 0);
Color yellowColor = const Color.fromARGB(235, 141, 108, 0);
Color blueColor = Colors.blue;
Color greenColor = Colors.green;
Color blackColor = const Color(0xff000000);
Color whiteColor = const Color(0xffffffff);
Color grayColor = const Color(0xffD9D9D9);

/// Widget Text
Widget wText(String text, Color color, double fontSize, FontWeight fontWeight) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    ),
  );
}

/// SizedBox untuk Height
Widget wSizedBoxHeight(double height) {
  return SizedBox(height: height);
}

/// SizedBox untuk Width
Widget wSizedBoxWidth(double width) {
  return SizedBox(width: width);
}

/// Navigator Push
Future<void> wPush(context, WidgetBuilder page) {
  return Navigator.push(context, MaterialPageRoute(builder: page));
}

/// Navigator Off
Future<void> wOff(BuildContext context, WidgetBuilder page) {
  return Navigator.pushReplacement(context, MaterialPageRoute(builder: page));
}

/// Button Bawah
Widget wButtonBottom(context, String textButton, VoidCallback onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 55,
      decoration: BoxDecoration(
          color: const Color(0xffFFC500),
          boxShadow: const [
            BoxShadow(
                color: Color(0xffc8c8c8), blurRadius: 10, offset: Offset(4, 6)),
          ],
          border: Border.all(color: Colors.black.withOpacity(0.13))),
      child: Center(
        child: Text(
          textButton,
          style: TextStyle(
            color: whiteColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
