import 'package:flutter/material.dart';
import 'package:kt1_textile_calculator/Figma_Design/Home_Page.dart';
import 'package:kt1_textile_calculator/Figma_Design/Oil_Mill_Calculator/Compare_Oil_Mill_Calculator/Forward_Compare_Oil_Mill_Calculator.dart';
import 'package:kt1_textile_calculator/Figma_Design/Oil_Mill_Calculator/Compare_Oil_Mill_Calculator/Reverse_Compare_Oil_Mill_Calculator.dart';

class Home_Compare_Oil_Mill_Calculator extends StatefulWidget {
  const Home_Compare_Oil_Mill_Calculator({Key? key}) : super(key: key);

  @override
  State<Home_Compare_Oil_Mill_Calculator> createState() => _Home_Compare_Oil_Mill_CalculatorState();
}

class _Home_Compare_Oil_Mill_CalculatorState extends State<Home_Compare_Oil_Mill_Calculator> with SingleTickerProviderStateMixin {
  bool _isFirstButtonSelected = true;
  late TabController _tabController;

  void _onButtonPressed(bool isFirstButton) {
    setState(() {
      _isFirstButtonSelected = isFirstButton;
    });
  }
  bool isButtonSelected = false;


  // for focusing  a node
  FocusNode focusnodekapas1 = FocusNode();
  FocusNode focusnodekapas2 = FocusNode();

  @override
  void dispose()
  {
    super.dispose();
  }


  @override
  void initState()
  {
    _tabController = TabController(length: 2, vsync: this);
  }

  Widget Forwarding_Both_Forward_And_Reverse_Compare_Page() {
    if (_isFirstButtonSelected)
    {
      return  Forward_Compare_Oil_Mill_Calculator();
    }
    else
    {
      return Reverse_Compare_Oil_Mill_Calculator();
    }
  }



  @override
  Widget build(BuildContext context) {
    double FixedHeight = MediaQuery.of(context).size.height;
    double FixedWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(FixedHeight*0.165),
          child: AppBar(
            actions: [
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Home_Page()));

                },
              )
            ],
            title: Text('Oil Mill Calculator'),
            backgroundColor: Color.fromRGBO(35, 35, 35, 1),
            elevation: 0,
            flexibleSpace: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(FixedHeight*0.03, 0, FixedHeight*0.03, FixedHeight*0.02),
                  child:  Container(


                    height: FixedHeight*0.055,
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(24),
                      color: Colors.grey[300],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding:  EdgeInsets.fromLTRB(2, 2, 0, 2),
                            child: TextButton(
                              onPressed: () => _onButtonPressed(true),
                              style: TextButton.styleFrom(
                                backgroundColor: _isFirstButtonSelected ? Color.fromRGBO(35, 35, 35, 1) : Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                              child: Text(
                                'Forward Ginning',
                                style: TextStyle(
                                  color: _isFirstButtonSelected ? Colors.white : Colors.grey[800],
                                  fontSize: FixedHeight*0.021,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:  EdgeInsets.fromLTRB(0, 2, 2, 2),
                            child: TextButton(
                              onPressed: () => _onButtonPressed(false),
                              style: TextButton.styleFrom(
                                backgroundColor: _isFirstButtonSelected ? Colors.transparent : Color.fromRGBO(35, 35, 35, 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                              ),
                              child: Text(
                                'Reverse Ginning',
                                style: TextStyle(
                                  color: _isFirstButtonSelected ? Colors.grey[800] : Colors.white,
                                  fontSize: FixedHeight*0.021,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),

        body:  SingleChildScrollView(child: Forwarding_Both_Forward_And_Reverse_Compare_Page()),


      ),
    );
  }

}
