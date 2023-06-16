import 'package:flutter/material.dart';

import '../../../Globaly Accesible/Appbar With 2 Slider.dart';
import 'Forward_Singal_Oil_Mill_Calculator.dart';
import 'Reverse_Singal_Oil_Mill_Calculator.dart';

class Home_Singal_Oil_Mill_Calculator extends StatefulWidget {
  const Home_Singal_Oil_Mill_Calculator({Key? key}) : super(key: key);

  @override
  State<Home_Singal_Oil_Mill_Calculator> createState() =>
      _Home_Singal_Oil_Mill_CalculatorState();
}

class _Home_Singal_Oil_Mill_CalculatorState
    extends State<Home_Singal_Oil_Mill_Calculator>
    with SingleTickerProviderStateMixin {
  bool _isForwardGinning = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Global_CustomAppBar(
        SliderText1: 'Forward Oil Mill',
        SliderText2: 'Reverse Oil Mill',
        AppbarText: 'Oil Mill Calculator',
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
            ? const Forward_Singal_Oil_Mill_Calculator()
            : const Reverse_Singal_Oil_Mill_Calculator(),
      ),
    );
  }
}
