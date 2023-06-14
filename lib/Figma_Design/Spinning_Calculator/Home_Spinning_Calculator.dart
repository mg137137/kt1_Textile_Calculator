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
        SliderText1: 'Loss Yarn',
        SliderText2: 'Profit Yarn',
        AppbarText: 'Spinning Calculator',
        isFirstButtonSelected: _isFirstButtonSelected1,
        onButtonPressed: _onButtonPressed,
      ),
      // body: SingleChildScrollView(
      //     child: Forwarding_Both_Forward_And_Reverse_Page(context)),

      body: _isFirstButtonSelected1
          ? const Loss_Yarn_Spinning_Calculator()
          : const Profit_Yarn_Spinning_Calculator(),
    );
  }
}
