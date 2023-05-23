import 'package:flutter/material.dart';
import 'package:kt1_textile_calculator/onlyContent/Ginning_Calculator.dart';
import 'package:kt1_textile_calculator/onlyContent/OilMill_Calculator.dart';

class only_box_Container_Design extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const only_box_Container_Design({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final boxsizeWidth = screenWidth * 0.45;
    final boxsizeHeight = screenWidth * 0.25;
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      decoration: BoxDecoration(
        color: Colors.lightGreen,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(4, 5),
            blurRadius: 5,
            color: Colors.black.withOpacity(0.5),
          ),
        ],
      ),
      width: boxsizeWidth,
      height: boxsizeHeight,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}

class only_box_Container extends StatelessWidget {
  const only_box_Container({super.key});

  @override
  Widget build(BuildContext context) {
    Color myColor = const Color.fromRGBO(93, 43, 43, 0.9);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            only_box_Container_Design(
              text: 'Gining\nCalculator',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Ginning_Calculator()));
              },
            ),
            only_box_Container_Design(
              text: 'Spinng\nCalculator',
              onPressed: () {},
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            only_box_Container_Design(
              text: 'Oil Mill\nCalculator',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OilMill_Calculator()));
              },
            ),
            only_box_Container_Design(
              text: 'Exports\nCalculator',
              onPressed: () {},
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            only_box_Container_Design(
              text: 'ICE Parity\nCalculator',
              onPressed: () {},
            ),
            only_box_Container_Design(
              text: 'Coversation\nCalculator',
              onPressed: () {},
            )
          ],
        )
      ],
    );
  }
}

class only_box_Container_dropDown_Menu extends StatefulWidget {
  const only_box_Container_dropDown_Menu({super.key});

  @override
  State<only_box_Container_dropDown_Menu> createState() =>
      _only_box_Container_dropDown_MenuState();
}

class _only_box_Container_dropDown_MenuState
    extends State<only_box_Container_dropDown_Menu> {
  String dropdownValue = 'Gujarat';
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;


    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
      margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      height: screenWidth * 0.11,
      width: screenWidth,
      color: Colors.blue,
      child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
        value: dropdownValue,
        dropdownColor: const Color.fromRGBO(255, 255, 255, 0.9019607843137255),
        underline: Container(),
        onChanged: (newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: <String>[
          'Gujarat',
          'Maharastra',
          'Telengana',
          'Madhya Pradesh',
          'Andhra Pradesh',
          'Karnataka',
          'Rajasthan'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      )),
    );
  }
}
