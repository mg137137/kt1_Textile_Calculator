import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kt1_textile_calculator/Figma_Design/Oil_Mill_Calculator/Singal_Oil_Mill_Calculator/Forward_Singal_Oil_Mill_Calculator.dart';
import 'package:kt1_textile_calculator/Figma_Design/Oil_Mill_Calculator/Singal_Oil_Mill_Calculator/Reverse_Singal_Oil_Mill_Calculator.dart';

import '../../../Globle_Access_Variables.dart';

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
  }

  @override
  void initState() {
    super.initState();

    _tabController1 = TabController(length: 2, vsync: this);
  }

  Widget Forwarding_Both_Forward_And_Reverse_Page(BuildContext context) {
    if (_isFirstButtonSelected1) {
      return Forward_Singal_Oil_Mill_Calculator();
    } else {
      return Reverse_Singal_Oil_Mill_Calculator();
    }
  }

  @override
  Widget build(BuildContext context) {
    double FixedHeight = MediaQuery.of(context).size.height;
    double FixedWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0.14.sh),
          child: AppBar(
            title: Text('Oil Mill Calculator',
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
      ),
    );
  }
}
