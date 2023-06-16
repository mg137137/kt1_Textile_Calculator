import 'package:flutter/material.dart';

import '../../../Globaly Accesible/Appbar With 2 Slider.dart';
import 'Loss_Yarn_Spinning_Calulator.dart';
import 'Profit_Yarn_Spinning_Calulator.dart';

class Home_Spinning_Calculator extends StatefulWidget {
  const Home_Spinning_Calculator({Key? key}) : super(key: key);

  @override
  State<Home_Spinning_Calculator> createState() =>
      _Home_Spinning_CalculatorState();
}

class _Home_Spinning_CalculatorState extends State<Home_Spinning_Calculator>
    with SingleTickerProviderStateMixin {
  bool _isForwardGinning = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Global_CustomAppBar(
        SliderText1: 'Loss Yarn',
        SliderText2: 'Profit Yarn',
        AppbarText: 'Spinning Calculator',
        isFirstButtonSelected: _isForwardGinning,
        onButtonPressed: (bool isFirstButton) {
          setState(() {
            _isForwardGinning = isFirstButton;
          });
        },
      ),
      body: GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details) {
          if (details.primaryVelocity! > 0) {
            // Swiped from left to right
            setState(() {
              _isForwardGinning = true;
            });
          } else if (details.primaryVelocity! < 0) {
            // Swiped from right to left
            setState(() {
              _isForwardGinning = false;
            });
          }
        },
        child: _isForwardGinning
            ? const Loss_Yarn_Spinning_Calculator()
            : const Profit_Yarn_Spinning_Calculator(),
      ),
    );
  }
}
