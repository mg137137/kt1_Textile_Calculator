import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Globaly Accesible/Buttons.dart';
import '../../../Globaly Accesible/Row  widget with 2 items.dart';
import '../../../Globaly Accesible/Screen Size Varibles.dart';
import '../../../Globaly Accesible/Stream Builder For Results.dart';

class Reverse_Compare_Ginning_Calculator extends StatefulWidget {
  const Reverse_Compare_Ginning_Calculator({Key? key}) : super(key: key);

  @override
  State<Reverse_Compare_Ginning_Calculator> createState() =>
      _Reverse_Compare_Ginning_CalculatorState();
}

class _Reverse_Compare_Ginning_CalculatorState
    extends State<Reverse_Compare_Ginning_Calculator> {
  final inputkapas1 = TextEditingController();
  final inputexpense1 = TextEditingController();
  final inputkapasia1 = TextEditingController();
  final inpututaro1 = TextEditingController();
  final inputghati1 = TextEditingController();

  StreamController<double> result_addition_inputkapas1_and_inputexpense1 =
      StreamController<double>();

  StreamController<double> result_final_output_padtar1 =
      StreamController<double>();

  String result_input_kapas1_and_expense1 = "0";
  String result_output_padtar1 = "0";

  double diff1 = 0;

  //for calculator 2

  final inputkapas2 = TextEditingController();
  final inputexpense2 = TextEditingController();
  final inputkapasia2 = TextEditingController();
  final inpututaro2 = TextEditingController();
  final inputghati2 = TextEditingController();

  StreamController<double> result_addition_inputkapas2_and_inputexpense2 =
      StreamController<double>();

  StreamController<double> result_final_output_padtar2 =
      StreamController<double>();

  String result_input_kapas2_and_expense2 = "0";
  String result_output_padtar2 = "0";
  double diff2 = 0;

  //for  differnece

  StreamController<double> result_output_difference =
      StreamController<double>();
  double result_difference = 0;
  // String result_output_difference = "0";

  // for focusing  a node
  FocusNode focusnodekapas1 = FocusNode();
  FocusNode focusnodekapas2 = FocusNode();

  @override
  void dispose() {
    inputkapas1.dispose();
    inputexpense1.dispose();
    inputkapasia1.dispose();
    inpututaro1.dispose();
    inputghati1.dispose();

    inputkapas2.dispose();
    inputexpense2.dispose();
    inputkapasia2.dispose();
    inpututaro2.dispose();
    inputghati2.dispose();

    result_addition_inputkapas1_and_inputexpense1.close();
    result_final_output_padtar1.close();

    result_addition_inputkapas2_and_inputexpense2.close();
    result_final_output_padtar2.close();

    result_output_difference.close();

    focusnodekapas1.dispose();
    focusnodekapas2.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    result_addition_inputkapas1_and_inputexpense1.add(0);
    result_final_output_padtar1.add(0);

    result_addition_inputkapas2_and_inputexpense2.add(0);
    result_final_output_padtar2.add(0);

    result_output_difference.add(0);

    inputkapas1.addListener(_updateValues_for_calculator1);
    inputexpense1.addListener(_updateValues_for_calculator1);
    inputkapasia1.addListener(_updateValues_for_calculator1);
    inpututaro1.addListener(_updateValues_for_calculator1);
    inputghati1.addListener(_updateValues_for_calculator1);

    inputkapas2.addListener(_updateValues_for_calculator2);
    inputexpense2.addListener(_updateValues_for_calculator2);
    inputkapasia2.addListener(_updateValues_for_calculator2);
    inpututaro2.addListener(_updateValues_for_calculator2);
    inputghati2.addListener(_updateValues_for_calculator2);
  }

  void _updateValues_for_calculator1() {
    // for calclator 1
    double store_input_kapas1 = double.tryParse(inputkapas1.text) ?? 0;
    double store_input_expense1 = double.tryParse(inputexpense1.text) ?? 0;
    double store_input_kapasia1 = double.tryParse(inputkapasia1.text) ?? 0;
    double store_input_utaro1 = double.tryParse(inpututaro1.text) ?? 0;
    double store_input_ghati1 = double.tryParse(inputghati1.text) ?? 0;

    // result_addition_inputkapas1_and_inputexpense1.add(sum1);
    double a1 = (store_input_kapas1 * 0.2812 / 5);
    double a2 = a1 * store_input_utaro1;
    double a3 = 100 - store_input_utaro1 - store_input_ghati1;
    double a4 = a3 * store_input_kapasia1;
    double a5 = a4 + a2;
    double a6 = a5 / 100;
    double a7 = a6 - store_input_expense1;
    diff1 = double.parse(a7.toStringAsFixed(2));
    double sum2 = double.parse(a7.toStringAsFixed(2));
    result_final_output_padtar1.add(sum2);

    // double a = sum1 * 100;
    // double b = 100 - store_input_utaro1 - (store_input_ghati1);
    // double c = store_input_kapasia1 * b;
    // double d = a - c;
    // double e = d / store_input_utaro1;
    // double f = e * 17.78;
    // diff1 = f;
    // int sum2 = f.round().toInt();
    // result_final_output_padtar1.add(sum2);

    setState(() {
      // result_input_kapas1_and_expense1 = sum1.toString();
      result_output_padtar1 = result_final_output_padtar1.toString();
      double diffother = (diff1 - diff2);
      double diff = double.parse(diffother.toStringAsFixed(2));

      result_output_difference.add(diff);
    });
  }

  void _updateValues_for_calculator2() {
    //for calculator 2
    double store_input_kapas2 = double.tryParse(inputkapas2.text) ?? 0;
    double store_input_expense2 = double.tryParse(inputexpense2.text) ?? 0;
    double store_input_kapasia2 = double.tryParse(inputkapasia2.text) ?? 0;
    double store_input_utaro2 = double.tryParse(inpututaro2.text) ?? 0;
    double store_input_ghati2 = double.tryParse(inputghati2.text) ?? 0;
    double sum1 = (store_input_kapas2 + store_input_expense2);
    result_addition_inputkapas2_and_inputexpense2.add(sum1);

    double a1 = (store_input_kapas2 * 0.2812 / 5);
    double a2 = a1 * store_input_utaro2;
    double a3 = 100 - store_input_utaro2 - store_input_ghati2;
    double a4 = a3 * store_input_kapasia2;
    double a5 = a4 + a2;
    double a6 = a5 / 100;
    double a7 = a6 - store_input_expense2;
    diff2 = double.parse(a7.toStringAsFixed(2));
    double sum2 = double.parse(a7.toStringAsFixed(2));
    result_final_output_padtar2.add(sum2);
    setState(() {
      result_output_padtar2 = result_final_output_padtar2.toString();
      // result_input_kapas2_and_expense2 = sum1.toString();

      double diffother = (diff1 - diff2);
      double diff = double.parse(diffother.toStringAsFixed(2));

      result_output_difference.add(diff);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          //Heading of Calculator
          GlobalRowCompareWidget2TEXT(
            title1: 'Calc1 ',
            title2: 'Calc2 ',
          ),

          //Content Of Calculator

          // Kappas
          GlobalRowCompareWidget2textfiels(
            title: 'Cotton Rate',
            controller1: inputkapas1,
            subtitle: 'Kappas',
            height: 0,
            width: 0,
            controller2: inputkapas2,
          ),

          // Expense
          GlobalRowCompareWidget2textfiels(
            title: 'Expense',
            controller1: inputexpense1,
            subtitle: 'nothing',
            height: 0,
            width: 0,
            controller2: inputexpense2,
          ),

          // // Answer of Kappas + Expense
          // GlobalRowCompareWidget2StreamBuilder(
          //   stream1: result_addition_inputkapas1_and_inputexpense1.stream,
          //   stream2: result_addition_inputkapas2_and_inputexpense2.stream,
          //   subtext1: '₹',
          //   subtext2: '₹',
          //   title1: 'Total',
          //   title2: 'Total',
          // ),

          // Cotton Seed
          GlobalRowCompareWidget2textfiels(
            title: 'Cotton Seed',
            controller1: inputkapasia1,
            subtitle: 'Cotton Seed',
            height: 0,
            width: 0,
            controller2: inputkapasia2,
          ),

          //Out Turn / Utaro
          GlobalRowCompareWidget2textfiels(
            title: 'Out Turn / Utaro',
            controller1: inpututaro1,
            subtitle: 'Out Turn',
            height: 0,
            width: 0,
            controller2: inpututaro2,
          ),

          //Shortage / Ghati
          GlobalRowCompareWidget2textfiels(
            title: 'Shortage / Ghati',
            controller1: inputghati1,
            subtitle: 'Shortage',
            height: 0,
            width: 0,
            controller2: inputghati2,
          ),

          // Final Answer
          GlobalRowCompareWidget2StreamBuilder(
            stream1: result_final_output_padtar1.stream,
            stream2: result_final_output_padtar2.stream,
            subtext1: '₹',
            subtext2: '₹',
            title1: 'Padtar',
            title2: 'Padtar',
          ),

          GlobalRowCompareWidget2Button(
            onpressed1: () {
              inputkapas1.clear();
              inputexpense1.clear();
              inputkapasia1.clear();
              inpututaro1.clear();
              inputghati1.clear();
              result_output_difference.add(0);
              focusnodekapas1.requestFocus();
            },
            onpressed2: () {
              inputkapas2.clear();
              inputexpense2.clear();
              inputkapasia2.clear();
              inpututaro2.clear();
              inputghati2.clear();
              result_output_difference.add(0);
              focusnodekapas2.requestFocus();
            },
            text1: 'RESET 1',
            text2: 'RESET 2',
          ),

          // Khandi Diffrnce or Stram result
          SizedBox(height: 20.h),
          Global_Stream_Builder_For_Results(
            stream: result_output_difference.stream,
            substreamtext: '₹',
            streamtitletext: 'Kappas Difference',
          ),

          // //Kapas Differnce
          // SizedBox(height: FixedHeight*0.01),
          // Container(
          //   width: FixedWidth*0.9,
          //   height: FixedHeight*0.05,
          //   decoration: BoxDecoration(
          //       border: Border.all(
          //         color: Colors.black,
          //         width: 2.0,
          //       ),
          //
          //       borderRadius: BorderRadius.circular(FixedHeight*0.015)
          //   ),
          //   child: Padding(
          //     padding: EdgeInsets.fromLTRB(FixedHeight*0.01, 0, 0, 0),
          //     child: Text('Kapas Difference : '+'hi',style: TextStyle(fontSize: FixedHeight*0.035),),
          //   ),
          //
          // ),

          // Reset All Button
          SizedBox(
            height: 20.h,
          ),
          Global_Button_Simple_Text(
            onPressed: () {
              inputkapas1.clear();
              inputexpense1.clear();
              inputkapasia1.clear();
              inpututaro1.clear();
              inputghati1.clear();
              inputkapas2.clear();
              inputexpense2.clear();
              inputkapasia2.clear();
              inpututaro2.clear();
              inputghati2.clear();
              result_output_difference.add(0);
              focusnodekapas1.requestFocus();
            },
            buttontext: 'Reset All',
            height: Global_Singal_Reset_Button_Height,
            width: Global_Singal_Reset_Button_Width,
          ),
        ],
      ),
    );
  }
}
