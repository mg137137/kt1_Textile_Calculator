import 'package:flutter/material.dart';

import '../../../Globaly Accesible/Appbar With 2 Slider.dart';
import 'Forward_Compare_Ginning_Calculator.dart';
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
  late bool _isForwardGinning;
  @override
  void initState() {
    _isForwardGinning = widget.for_or_reverse;
    // _isFirstButtonSelected1 = widget.for_or_reverse;
    // setState(() {
    //   if (_isFirstButtonSelected1) {
    //     _isForwardGinning = true;
    //   } else {
    //     _isForwardGinning = false;
    //   }
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Global_CustomAppBar(
        SliderText1: 'Forward Ginning',
        SliderText2: 'Reverse Ginning',
        AppbarText: 'Ginning Compare Calculator',
        isFirstButtonSelected: _isForwardGinning,
        onButtonPressed: (bool isFirstButton) {
          setState(() {
            _isForwardGinning = isFirstButton;
          });
        },
      ),
      body: GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details) {
          if (details.primaryVelocity! > 0) {
            // Swiped from left to right
            setState(() {
              _isForwardGinning = true;
            });
          } else if (details.primaryVelocity! < 0) {
            // Swiped from right to left
            setState(() {
              _isForwardGinning = false;
            });
          }
        },
        child: _isForwardGinning
            ? const Forward_Compare_Ginning_Calculator()
            : const Reverse_Compare_Ginning_Calculator(),
      ),
    );
  }
}

//
//
//
//   late bool _isFirstButtonSelected1;
//   late TabController _tabController1;
//   void _onButtonPressed(bool isFirstButton) {
//     setState(() {
//       _isFirstButtonSelected1 = isFirstButton;
//     });
//   }
//
//   bool isButtonSelected = false;
//
//   @override
//   void dispose() {
//     super.dispose();
//     _tabController1.dispose();
//   }
//
//   @override
//   void initState() {
//     _isFirstButtonSelected1 = widget.for_or_reverse;
//     super.initState();
//
//     _tabController1 = TabController(length: 2, vsync: this);
//   }
//
//   Widget Forwarding_Both_Forward_And_Reverse_Page(BuildContext context) {
//     if (_isFirstButtonSelected1) {
//       return const Forward_Compare_Ginning_Calculator();
//     } else {
//       return const Reverse_Compare_Ginning_Calculator();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // double FixedHeight = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       appBar: PreferredSize(
//           preferredSize: Size.fromHeight(0.14.sh),
//           child: Global_CustomAppBar(
//             SliderText1: 'Forward Ginning',
//             SliderText2: 'Reverse Ginning',
//             AppbarText: ' Comapre Gininng Calculator',
//             isFirstButtonSelected: _isFirstButtonSelected1,
//             onButtonPressed: _onButtonPressed,
//           )),
//       body: SingleChildScrollView(
//           child: Forwarding_Both_Forward_And_Reverse_Page(context)),
//     );
//   }
// }
