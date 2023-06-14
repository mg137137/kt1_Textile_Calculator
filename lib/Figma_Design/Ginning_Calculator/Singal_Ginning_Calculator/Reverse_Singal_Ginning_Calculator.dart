import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kt1_textile_calculator/Figma_Design/Ginning_Calculator/Compare_Ginning_Calculator/Home_Compare_Ginning_Calculator.dart';

import '../../../Globaly Accesible/Buttons.dart';
import '../../../Globaly Accesible/Row widget with 3 items.dart';
import '../../../Globaly Accesible/Screen Size Varibles.dart';
import '../../../Globaly Accesible/Stream Builder For Results.dart';

class Reverse_Singal_Ginning_Calculator extends StatefulWidget {
  const Reverse_Singal_Ginning_Calculator({Key? key}) : super(key: key);

  @override
  State<Reverse_Singal_Ginning_Calculator> createState() =>
      _Reverse_Singal_Ginning_CalculatorState();
}

class _Reverse_Singal_Ginning_CalculatorState
    extends State<Reverse_Singal_Ginning_Calculator> {
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
    diff1 = a7;
    double sum2 = double.parse(a7.toStringAsFixed(2));
    result_final_output_padtar1.add(sum2);

    setState(() {
      // result_input_kapas1_and_expense1 = sum1.toString();
      result_output_padtar1 = result_final_output_padtar1.toString();
      double diff = (diff1 - diff2);

      result_output_difference.add(diff);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          GlobalRowWidget(
            height: Global_Singal_Textfied_Height,
            width: Global_Singal_Textfied_Width,
            title: 'Cotton Rate',
            controller: inputkapas1,
            subtitle: '₹/Bale',
          ),

          // Expense
          GlobalRowWidget(
            height: Global_Singal_Textfied_Height,
            width: Global_Singal_Textfied_Width,
            title: 'Expense',
            controller: inputexpense1,
            subtitle: '₹/20kg',
          ),

          // Cotton Seed
          GlobalRowWidget(
            height: Global_Singal_Textfied_Height,
            width: Global_Singal_Textfied_Width,
            title: 'Cotton Seed',
            controller: inputkapasia1,
            subtitle: '₹/20kg',
          ),

          // Out Turn / Utaro
          GlobalRowWidget(
            height: Global_Singal_Textfied_Height,
            width: Global_Singal_Textfied_Width,
            title: 'Out Turn / Utaro',
            controller: inpututaro1,
            subtitle: 'Percentage %',
          ),

          // Shortage / Ghati
          GlobalRowWidget(
            height: Global_Singal_Textfied_Height,
            width: Global_Singal_Textfied_Width,
            title: 'Shortage / Ghati',
            controller: inputghati1,
            subtitle: 'Percentage %',
          ),

          SizedBox(height: 30.h),

          // Dispaly Stream Text
          Global_Stream_Builder_For_Results(
            stream: result_final_output_padtar1.stream,
            substreamtext: '₹/20Kg',
            streamtitletext: 'Kappas Coast',
          ),

          // Reset Button
          Global_Button_Simple_Text(
            onPressed: () {
              inputkapas1.clear();
              inputexpense1.clear();
              inputkapasia1.clear();
              inpututaro1.clear();
              inputghati1.clear();

              focusnodekapas1.requestFocus();
            },
            buttontext: 'Reset',
            height: Global_Singal_Reset_Button_Height,
            width: Global_Singal_Reset_Button_Width,
          ),

          //Compare Button
          Global_Button_Gradient_Text(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Home_Compare_Ginning_Calculator(
                    for_or_reverse: false,
                  ),
                ),
              );
            },
            buttontext: 'Compare',
            height: Global_Singal_Comare_Button_Height,
            width: Global_Singal_Comare_Button_Width,
          ),
        ],
      ),
    );
  }
}
