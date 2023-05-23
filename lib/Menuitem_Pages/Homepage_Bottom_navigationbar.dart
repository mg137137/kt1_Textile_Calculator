import 'package:flutter/material.dart';
import 'package:kt1_textile_calculator/Advertise/Advetise_Marquee.dart';
import 'package:kt1_textile_calculator/Appbar_All/Homepage_Appbar.dart';
import 'package:kt1_textile_calculator/onlyContent/only_box_Container.dart';

class Homepage_Bottom_navigationbar extends StatefulWidget {
  const Homepage_Bottom_navigationbar({Key? key}) : super(key: key);

  @override
  State<Homepage_Bottom_navigationbar> createState() =>
      _Homepage_Bottom_navigationbarState();
}

class _Homepage_Bottom_navigationbarState
    extends State<Homepage_Bottom_navigationbar> {
  final List<Widget> pageContents = [
    const only_box_Container_dropDown_Menu(),
    const only_box_Container(),
    const Advetise_Marquee(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:
            Homepage_Appbar(titleText: 'Textile Calculator', onPressed: () {}),
        body: ListView.builder(
          itemCount: pageContents.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                const SizedBox(height: 16.0),
                pageContents[index],
                // Add space between pages
              ],
            );
          },
        ),
      ),
    );
  }
}
