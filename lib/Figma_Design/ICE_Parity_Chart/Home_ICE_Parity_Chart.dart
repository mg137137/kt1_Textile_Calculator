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
        SliderText1: 'Physical Cotton',
        SliderText2: 'MCX',
        AppbarText: 'ICE Parity',
        isFirstButtonSelected: _isFirstButtonSelected1,
        onButtonPressed: _onButtonPressed,
      ),
      // body: SingleChildScrollView(
      //     child: Forwarding_Both_Forward_And_Reverse_Page(context)),

      body: _isFirstButtonSelected1 ? const Physical_Cotton() : const MCX(),
    );
  }
}
