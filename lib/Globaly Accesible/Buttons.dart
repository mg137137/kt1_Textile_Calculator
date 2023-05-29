import 'package:flutter/material.dart';
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
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(35, 35, 35, 0.9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: GradientText(
          buttontext,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 10),
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
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(35, 35, 35, 0.9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          buttontext,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
