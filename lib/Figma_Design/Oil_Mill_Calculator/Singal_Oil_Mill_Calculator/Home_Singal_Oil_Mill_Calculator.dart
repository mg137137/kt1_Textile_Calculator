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
        SliderText1: 'Forward Oil Mill',
        SliderText2: 'Reverse Oil Mill',
        AppbarText: 'Oil Mill Calculator',
        isFirstButtonSelected: _isFirstButtonSelected1,
        onButtonPressed: _onButtonPressed,
      ),
      // body: SingleChildScrollView(
      //     child: Forwarding_Both_Forward_And_Reverse_Page(context)),

      body: _isFirstButtonSelected1
          ? const Forward_Singal_Oil_Mill_Calculator()
          : const Reverse_Singal_Oil_Mill_Calculator(),
    );
  }
}
