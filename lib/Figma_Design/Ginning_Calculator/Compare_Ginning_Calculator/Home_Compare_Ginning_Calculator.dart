import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kt1_textile_calculator/Figma_Design/Ginning_Calculator/Compare_Ginning_Calculator/Forward_Compare_Ginning_Calculator.dart';

import '../../../Globaly Accesible/Appbar With 2 Slider.dart';
import 'Reverse_Compare_Ginning_Calculator.dart';

class Home_Compare_Ginning_Calculator extends StatefulWidget {
  final bool for_or_reverse;
  const Home_Compare_Ginning_Calculator(
      {Key? key, required this.for_or_reverse})
      : super(key: key);

  @override
  State<Home_Compare_Ginning_Calculator> createState() =>
      _Home_Compare_Ginning_CalculatorState();
}

class _Home_Compare_Ginning_CalculatorState
    extends State<Home_Compare_Ginning_Calculator>
    with SingleTickerProviderStateMixin {
  late bool _isFirstButtonSelected1;
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
    _isFirstButtonSelected1 = widget.for_or_reverse;
    super.initState();

    _tabController1 = TabController(length: 2, vsync: this);
  }

  Widget Forwarding_Both_Forward_And_Reverse_Page(BuildContext context) {
    if (_isFirstButtonSelected1) {
      return const Forward_Compare_Ginning_Calculator();
    } else {
      return const Reverse_Compare_Ginning_Calculator();
    }
  }

  @override
  Widget build(BuildContext context) {
    // double FixedHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.14.sh),
          child: Global_CustomAppBar(
            SliderText1: 'Forward Ginning',
            SliderText2: 'Reverse Ginning',
            AppbarText: ' Comapre Gininng Calculator',
            isFirstButtonSelected: _isFirstButtonSelected1,
            onButtonPressed: _onButtonPressed,
          )),
      body: SingleChildScrollView(
          child: Forwarding_Both_Forward_And_Reverse_Page(context)),
    );
  }
}
