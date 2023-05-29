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
    extends State<Home_Singal_Ginning_Calculator>
    with SingleTickerProviderStateMixin {
  bool _isFirstButtonSelected1 = true;
  late TabController _tabController1;
  void _onButtonPressed(bool isFirstButton) {
    setState(() {
      _isFirstButtonSelected1 = isFirstButton;
    });
  }

  bool isButtonSelected = false;

  @override
  void dispose() {
    super.dispose();
    _tabController1.dispose();
  }

  @override
  void initState() {
    super.initState();

    _tabController1 = TabController(length: 2, vsync: this);
  }

  Widget Forwarding_Both_Forward_And_Reverse_Page(BuildContext context) {
    if (_isFirstButtonSelected1) {
      return const Forward_Singal_Ginning_Calculator();
    } else {
      return const Reverse_Singal_Ginning_Calculator();
    }
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    // double FixedHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: Global_CustomAppBar(
        SliderText1: 'Forward Ginning',
        SliderText2: 'Reverse Ginning',
        AppbarText: 'Gininng Calculator',
        isFirstButtonSelected: _isFirstButtonSelected1,
        onButtonPressed: _onButtonPressed,
      ),
      body: SingleChildScrollView(
          child: Forwarding_Both_Forward_And_Reverse_Page(context)),
    );
  }
}
