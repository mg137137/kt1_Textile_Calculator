import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kt1_textile_calculator/Figma_Design/Ginning_Calculator/Compare_Ginning_Calculator/Forward_Compare_Ginning_Calculator.dart';

import '../../../Globaly Accesible/Globle_Access_Variables.dart';
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
        child: AppBar(
          title: Text('Ginning Calculator',
              style: TextStyle(
                  fontSize: 0.025.sh,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          backgroundColor: Universal_Gray,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(0.05.sh),
            ),
          ),
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0.05.sh, 0, 0.05.sh, 0.01.sh),
                height: 0.05.sh,
                width: 1.sw,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Colors.grey[300],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            0.005.sw, 0.005.sh, 0.005.sw, 0.005.sh),
                        child: TextButton(
                          onPressed: () => _onButtonPressed(true),
                          style: TextButton.styleFrom(
                            backgroundColor: _isFirstButtonSelected1
                                ? const Color.fromRGBO(35, 35, 35, 1)
                                : Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: Text(
                            'Forward Ginning',
                            style: TextStyle(
                              color: _isFirstButtonSelected1
                                  ? Colors.white
                                  : Colors.grey[800],
                              fontSize: 0.015.sh,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            0.005.sh, 0.005.sh, 0.005.sh, 0.005.sh),
                        child: TextButton(
                          onPressed: () => _onButtonPressed(false),
                          style: TextButton.styleFrom(
                            backgroundColor: _isFirstButtonSelected1
                                ? Colors.transparent
                                : const Color.fromRGBO(35, 35, 35, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: Text(
                            'Reverse Ginning',
                            style: TextStyle(
                              color: _isFirstButtonSelected1
                                  ? Colors.grey[800]
                                  : Colors.white,
                              fontSize: 0.015.sh,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Forwarding_Both_Forward_And_Reverse_Page(context)),
    );
  }
}
