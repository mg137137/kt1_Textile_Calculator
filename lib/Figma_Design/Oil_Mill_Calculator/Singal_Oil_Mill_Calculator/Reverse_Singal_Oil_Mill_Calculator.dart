import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../Globaly Accesible/Globle_Access_Variables.dart';

class Reverse_Singal_Oil_Mill_Calculator extends StatefulWidget {
  const Reverse_Singal_Oil_Mill_Calculator({Key? key}) : super(key: key);

  @override
  State<Reverse_Singal_Oil_Mill_Calculator> createState() =>
      _Reverse_Singal_Oil_Mill_CalculatorState();
}

class _Reverse_Singal_Oil_Mill_CalculatorState
    extends State<Reverse_Singal_Oil_Mill_Calculator> {
  final inputkapas1 = TextEditingController();
  final inputexpense1 = TextEditingController();
  final inputkapasia1 = TextEditingController();
  final inpututaro1 = TextEditingController();
  final inputghati1 = TextEditingController();

  StreamController<int> result_addition_inputkapas1_and_inputexpense1 =
      StreamController<int>();

  StreamController<int> result_final_output_padtar1 = StreamController<int>();

  String result_input_kapas1_and_expense1 = "0";
  String result_output_padtar1 = "0";

  double diff1 = 0;

  //for calculator 2

  final inputkapas2 = TextEditingController();
  final inputexpense2 = TextEditingController();
  final inputkapasia2 = TextEditingController();
  final inpututaro2 = TextEditingController();
  final inputghati2 = TextEditingController();

  StreamController<int> result_addition_inputkapas2_and_inputexpense2 =
      StreamController<int>();

  StreamController<int> result_final_output_padtar2 = StreamController<int>();

  String result_input_kapas2_and_expense2 = "0";
  String result_output_padtar2 = "0";
  double diff2 = 0;

  //for  differnece

  StreamController<int> result_output_difference = StreamController<int>();
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
    int a1 = (store_input_kapas1 * 0.2812 / 5).round().toInt();
    double a2 = a1 * store_input_utaro1;
    double a3 = 100 - store_input_utaro1 - store_input_ghati1;
    double a4 = a3 * store_input_kapasia1;
    double a5 = a4 + a2;
    double a6 = a5 / 100;
    double a7 = a6 - store_input_expense1;
    diff1 = a7;
    int sum2 = a7.round().toInt();
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
      int diff = (diff1 - diff2).round().toInt();

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
    int sum1 = (store_input_kapas2 + store_input_expense2).round().toInt();
    result_addition_inputkapas2_and_inputexpense2.add(sum1);

    int a1 = (store_input_kapas2 * 0.2812 / 5).round().toInt();
    double a2 = a1 * store_input_utaro2;
    double a3 = 100 - store_input_utaro2 - store_input_ghati2;
    double a4 = a3 * store_input_kapasia2;
    double a5 = a4 + a2;
    double a6 = a5 / 100;
    double a7 = a6 - store_input_expense2;
    diff2 = a7;
    int sum2 = a7.round().toInt();
    result_final_output_padtar2.add(sum2);
    setState(() {
      result_output_padtar2 = result_final_output_padtar2.toString();
      // result_input_kapas2_and_expense2 = sum1.toString();

      int diff = (diff1 - diff2).round().toInt();

      result_output_difference.add(diff);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                //Kapas
                buildRowWidget('Oil Cake Cost', inputkapas1, '₹/Bale', 0, 0),

                // Expense
                buildRowWidget('Expense', inputexpense1, '₹/20kg', 0, 0),

                // Cotton Seed
                buildRowWidget('Oil Rate', inputkapasia1, '₹/20kg', 0, 0),

                // Out Turn / Utaro
                buildRowWidget('Oil', inpututaro1, 'Percentage %', 0, 0),

                // Shortage / Ghati
                buildRowWidget('Oil Cake', inputghati1, 'Percentage %', 0, 0),

                buildRowWidget('Packing Size', inputghati1, 'Kg', 0, 0),
              ],
            ),
          ),
          Container(
            width: 0.9.sw,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Text(
                  'Cotton Seed',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(
                  width: 0.02.sh,
                ),
                Expanded(
                  child: Container(
                    height: 0.045.sh,
                    width: 0.6.sw,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.0,
                      ),
                      color: Colors.grey[350],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: StreamBuilder<int>(
                      stream: result_final_output_padtar1.stream,
                      builder:
                          (BuildContext context, AsyncSnapshot<int> snapshot) {
                        if (snapshot.hasData) {
                          return GradientText(
                            '${snapshot.data}' + ' ₹/20kg',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.bold),
                            colors: [
                              Colors.black,
                              Colors.teal,
                              Colors.red,
                            ],
                          );
                        } else {
                          return Text('0');
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 0.04.sh,
            width: 0.4.sw,
            child: ElevatedButton(
                child: Text(
                  'Reset',
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(35, 35, 35, 0.9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // <-- Radius
                  ),
                ),
                onPressed: () {
                  inputkapas1.clear();
                  inputexpense1.clear();
                  inputkapasia1.clear();
                  inpututaro1.clear();
                  inputghati1.clear();

                  focusnodekapas1.requestFocus();
                }),
          ),
          SizedBox(height: 0.01.sh),
          Container(
            height: 0.05.sh,
            width: 0.4.sw,
            child: ElevatedButton(
                child: GradientText(
                  'Compare',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10),
                  colors: [
                    Colors.blue,
                    Colors.red,
                    Colors.teal,
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(35, 35, 35, 0.9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // <-- Radius
                  ),
                ),
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             Home_Compare_Ginning_Calculator(
                  //               for_or_reverse: false,
                  //             )));
                }),
          ),
        ],
      ),
    );
  }
}
