import 'package:flutter/material.dart';
import 'package:kt1_textile_calculator/Figma_Design/Ginning_Calculator/Singal_Ginning_Calculator/Forward_Singal_Ginning_Calculator.dart';
import 'package:kt1_textile_calculator/Figma_Design/Ginning_Calculator/Singal_Ginning_Calculator/Reverse_Singal_Ginning_Calculator.dart';

import '../../../Globaly Accesible/Appbar With 2 Slider.dart';

class Home_Singal_Ginning_Calculator extends StatefulWidget {
  const Home_Singal_Ginning_Calculator({Key? key}) : super(key: key);

  @override
  State<Home_Singal_Ginning_Calculator> createState() =>
      _Home_Singal_Ginning_CalculatorState();
}

class _Home_Singal_Ginning_CalculatorState
    extends State<Home_Singal_Ginning_Calculator> {
  bool _isForwardGinning = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Global_CustomAppBar(
        SliderText1: 'Forward Ginning',
        SliderText2: 'Reverse Ginning',
        AppbarText: 'Ginning Calculator',
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
            ? const Forward_Singal_Ginning_Calculator()
            : const Reverse_Singal_Ginning_Calculator(),
      ),
    );
  }
}
