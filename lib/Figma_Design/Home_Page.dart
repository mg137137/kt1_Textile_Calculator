import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kt1_textile_calculator/Figma_Design/Exports_Calculation/Home_Export_Calculation.dart';

import '../Globle_Access_Variables.dart';
import 'Ginning_Calculator/Singal_Ginning_Calculator/Home_Singal_Ginning_Calculator.dart';
import 'ICE_Parity_Chart/Home_ICE_Parity_Chart.dart';
import 'Oil_Mill_Calculator/Singal_Oil_Mill_Calculator/Home_Singal_Oil_Mill_Calculator.dart';
import 'Spinning_Calculator/Home_Spinning_Calculator.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);
  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  String? _selectedItem;
  final List<String> _dropdownItems = [
    'Gujarat',
    'Maharastra',
    'Telengana',
    'Madhya Pradesh',
  ];
  @override
  void initState() {
    super.initState();
    _selectedItem = _dropdownItems[0];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // double FixedHeight = constraints.maxHeight;
        // double FixedWidth = constraints.maxWidth;

        Widget _buildElevatedButtonContainer(
            String imageAsset, String buttonText, VoidCallback onPressed) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.grey.withOpacity(0.9),
                ),
              ],
            ),
            height: 0.17.sh,
            width: 0.25.sw,
            child: ElevatedButton(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    // alignment: Alignment.topCenter,
                    image: AssetImage(imageAsset),
                    width: 0.15.sw,
                    height: 0.09.sh,
                  ),
                  Text(
                    buttonText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      // fontSize: FixedHeight / 51,
                      fontSize: 0.025.sw,

                      fontWeight: FontWeight.bold,
                      // height: 0.0015.sh,
                    ),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(255, 255, 255, 0.9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: onPressed,
            ),
          );
        }

        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(0.14.sh),
            child: AppBar(
              centerTitle: true,
              title: Text('Textile Calculator',
                  style: TextStyle(
                      fontSize: 0.03.sh,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(50),
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 0.03.sh,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Home_Page()));
                  },
                )
              ],
              backgroundColor: Universal_Gray,
              elevation: 1,
              flexibleSpace: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0.015.sh),
                    height: 0.05.sh,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.grey[300],
                    ),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0.01.sw, 0, 0.01.sw, 0),
                      alignment: Alignment.center,
                      // height: FixedHeight / 22,
                      width: 0.7.sw,
                      // padding: EdgeInsets.fromLTRB(
                      //     FixedHeight / 70, 0, FixedHeight / 70, 0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: DropdownButton(
                        isExpanded: true,
                        isDense: true,

                        underline: Container(),
                        value: _selectedItem,
                        items: _dropdownItems.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                            ),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedItem = newValue;
                          });
                        },
                        style: const TextStyle(
                            color: Colors.black), // Set the text color
                        iconEnabledColor:
                            Colors.black, // Set the arrow icon color
                        dropdownColor:
                            Colors.white, // Set the dropdown menu color
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: ListView(
            children: [
              Column(
                children: [
                  SizedBox(height: 0.02.sh),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildElevatedButtonContainer(
                        'assets/splash.png',
                        'Ginning Calculator',
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const Home_Singal_Ginning_Calculator(),
                            ),
                          );
                        },
                      ),
                      _buildElevatedButtonContainer(
                        'assets/splash.png',
                        'Oil Mill Calculator',
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const Home_Singal_Oil_Mill_Calculator(),
                            ),
                          );
                        },
                      ),
                      _buildElevatedButtonContainer(
                        'assets/splash.png',
                        'Spinning Calculator',
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const Home_Spinning_Calculator(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 0.02.sh),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildElevatedButtonContainer(
                        'assets/splash.png',
                        'Exports Calculation',
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const Home_Export_Calculation(),
                            ),
                          );
                        },
                      ),
                      _buildElevatedButtonContainer(
                        'assets/splash.png',
                        'Conversation',
                        () {},
                      ),
                      _buildElevatedButtonContainer(
                        'assets/splash.png',
                        'ICE Parity Chart',
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const Home_ICE_Parity_Chart(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 0.02.sh),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildElevatedButtonContainer(
                        'assets/splash.png',
                        'Staple Conversation Chart',
                        () {},
                      ),
                      _buildElevatedButtonContainer(
                        'assets/splash.png',
                        'Ceramic Calculator',
                        () {},
                      ),
                      _buildElevatedButtonContainer(
                        'assets/splash.png',
                        'Demo Calculator',
                        () {},
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
