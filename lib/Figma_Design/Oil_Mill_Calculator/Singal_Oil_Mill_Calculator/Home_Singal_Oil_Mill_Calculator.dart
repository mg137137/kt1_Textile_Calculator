import 'package:flutter/material.dart';
import 'package:kt1_textile_calculator/Figma_Design/Oil_Mill_Calculator/Singal_Oil_Mill_Calculator/Forward_Singal_Oil_Mill_Calculator.dart';
import 'package:kt1_textile_calculator/Figma_Design/Oil_Mill_Calculator/Singal_Oil_Mill_Calculator/Reverse_Singal_Oil_Mill_Calculator.dart';

import '../../../Globaly Accesible/Appbar With 2 Slider.dart';

class Home_Singal_Oil_Mill_Calculator extends StatefulWidget {
  const Home_Singal_Oil_Mill_Calculator({Key? key}) : super(key: key);

  @override
  State<Home_Singal_Oil_Mill_Calculator> createState() =>
      _Home_Singal_Oil_Mill_CalculatorState();
}

class _Home_Singal_Oil_Mill_CalculatorState
    extends State<Home_Singal_Oil_Mill_Calculator>
    with SingleTickerProviderStateMixin {
  bool _isFirstButtonSelected1 = true;
  void _onButtonPressed(bool isFirstButton) {
    setState(() {
      _isFirstButtonSelected1 = isFirstButton;
    });
  }

  bool isButtonSelected = false;

  @override
  void initState() {
    super.initState();
  }

  Widget Forwarding_Both_Forward_And_Reverse_Page(BuildContext context) {
    if (_isFirstButtonSelected1) {
      return const Forward_Singal_Oil_Mill_Calculator();
    } else {
      return const Reverse_Singal_Oil_Mill_Calculator();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: Global_CustomAppBar(
          SliderText1: 'Forward Oil Mill',
          SliderText2: 'Reverse Oil Mill',
          AppbarText: 'Oil Mill Calculator',
          isFirstButtonSelected: _isFirstButtonSelected1,
          onButtonPressed: _onButtonPressed,
        ),
        body: SingleChildScrollView(
            child: Forwarding_Both_Forward_And_Reverse_Page(context)),
      ),
    );
  }
}
