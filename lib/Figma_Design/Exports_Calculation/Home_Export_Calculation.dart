import 'package:flutter/material.dart';

import '../../../Globaly Accesible/Appbar With 2 Slider.dart';
import 'Forward_Export_Calculation.dart';
import 'Reverse_Export_Calculation.dart';

class Home_Export_Calculation extends StatefulWidget {
  const Home_Export_Calculation({Key? key}) : super(key: key);

  @override
  State<Home_Export_Calculation> createState() =>
      _Home_Export_CalculationState();
}

class _Home_Export_CalculationState extends State<Home_Export_Calculation>
    with SingleTickerProviderStateMixin {
  bool _isForwardGinning = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Global_CustomAppBar(
        SliderText1: 'Export Forward',
        SliderText2: 'Reverse Export',
        AppbarText: 'Export Calculator',
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
            ? const Forward_Export_Calculation()
            : const Reverse_Export_Calculation(),
      ),
    );
  }
}
