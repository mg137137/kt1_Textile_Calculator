import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Globaly Accesible/Globle_Access_Variables.dart';
import '../Globaly Accesible/Home Page Box Container.dart';
import 'Exports_Calculation/Home_Export_Calculation.dart';
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(350.h),
        child: AppBar(
          centerTitle: true,
          title: Text('Textile Calculator',
              style: TextStyle(
                  fontSize: 70.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(150.sp),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
                size: 100.sp,
              ),
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => const Home_Page()));
              },
            )
          ],
          backgroundColor: Universal_Gray,
          elevation: 2,
          flexibleSpace: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 20.sp),
              height: 120.h,
              width: 1000.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(150.sp),
                color: Colors.grey[300],
              ),
              child: Container(
                padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(100.sp),
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
                  iconEnabledColor: Colors.black, // Set the arrow icon color
                  dropdownColor: Colors.white, // Set the dropdown menu color
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 0.02.sh),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Home_Page_Box_Container(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const Home_Singal_Ginning_Calculator(),
                      ),
                    );
                  },
                  imageAsset: 'assets/splash.png',
                  buttonText: 'Ginning Calculator',
                ),
                Home_Page_Box_Container(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home_Singal_Oil_Mill_Calculator(),
                      ),
                    );
                  },
                  imageAsset: 'assets/splash.png',
                  buttonText: 'Oil Mill Calculator',
                ),
                Home_Page_Box_Container(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Home_Spinning_Calculator(),
                      ),
                    );
                  },
                  imageAsset: 'assets/splash.png',
                  buttonText: 'Spinning Calculator',
                ),
              ],
            ),
            SizedBox(height: 0.02.sh),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Home_Page_Box_Container(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Home_Export_Calculation(),
                      ),
                    );
                  },
                  imageAsset: 'assets/splash.png',
                  buttonText: 'Exports Calculation',
                ),
                Home_Page_Box_Container(
                  onPressed: () {},
                  imageAsset: 'assets/splash.png',
                  buttonText: 'Conversation',
                ),
                Home_Page_Box_Container(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Home_ICE_Parity_Chart(),
                      ),
                    );
                  },
                  imageAsset: 'assets/splash.png',
                  buttonText: 'ICE Parity Chart',
                ),
              ],
            ),
            SizedBox(height: 0.02.sh),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Home_Page_Box_Container(
                  onPressed: () {},
                  imageAsset: 'assets/splash.png',
                  buttonText: 'Staple Conversation Chart',
                ),
                Home_Page_Box_Container(
                  onPressed: () {},
                  imageAsset: 'assets/splash.png',
                  buttonText: 'Ceramic Calculator',
                ),
                Home_Page_Box_Container(
                  onPressed: () {},
                  imageAsset: 'assets/splash.png',
                  buttonText: 'Demo Calculator',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
