import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Global_Button_Gradient_Text extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttontext;
  final double height;
  final double width;

  const Global_Button_Gradient_Text(
      {super.key,
      required this.onPressed,
      required this.buttontext,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(300.w, 0, 300.w, 0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(35, 35, 35, 0.9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.sp),
          ),
        ),
        onPressed: onPressed,
        child: GradientText(
          buttontext,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 60.sp),
          colors: const [
            Colors.blue,
            Colors.red,
            Colors.teal,
          ],
        ),
      ),
    );
  }
}

class Global_Button_Simple_Text extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttontext;
  final double height;
  final double width;

  const Global_Button_Simple_Text(
      {super.key,
      required this.onPressed,
      required this.buttontext,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(400.w, 0, 400.w, 0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(35, 35, 35, 0.9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.sp),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttontext,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: TextStyle(fontSize: 60.sp),
        ),
      ),
    );
  }
}
