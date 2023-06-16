import 'package:flutter/material.dart';

import '../../../Globaly Accesible/Appbar With 2 Slider.dart';
import 'MCX.dart';
import 'Physical_Cotton.dart';

class Home_ICE_Parity_Chart extends StatefulWidget {
  const Home_ICE_Parity_Chart({Key? key}) : super(key: key);

  @override
  State<Home_ICE_Parity_Chart> createState() => _Home_ICE_Parity_ChartState();
}

class _Home_ICE_Parity_ChartState extends State<Home_ICE_Parity_Chart>
    with SingleTickerProviderStateMixin {
  bool _isForwardGinning = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Global_CustomAppBar(
        SliderText1: 'Physical Cotton',
        SliderText2: 'MCX',
        AppbarText: 'ICE Parity',
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
        child: _isForwardGinning ? const Physical_Cotton() : const MCX(),
      ),
    );
  }
}
