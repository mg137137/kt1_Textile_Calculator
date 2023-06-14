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
  bool _isFirstButtonSelected1 = true;
  bool isButtonSelected = false;
  late TabController _tabController1;

  void _onButtonPressed(bool isFirstButton) {
    setState(() {
      _isFirstButtonSelected1 = isFirstButton;
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Global_CustomAppBar(
        SliderText1: 'Export Forward',
        SliderText2: 'Reverse Export',
        AppbarText: 'Export Calculator',
        isFirstButtonSelected: _isFirstButtonSelected1,
        onButtonPressed: _onButtonPressed,
      ),
      // body: SingleChildScrollView(
      //     child: Forwarding_Both_Forward_And_Reverse_Page(context)),

      body: _isFirstButtonSelected1
          ? const Forward_Export_Calculation()
          : const Reverse_Export_Calculation(),
    );
  }
}
