import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kt1_textile_calculator/Globle_Access_Variables.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

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
    double FixedHeight = MediaQuery.of(context).size.height;
    double FixedWidth = MediaQuery.of(context).size.width;

    Decoration Main_White_Box_Decoration() {
      return BoxDecoration(
        // border: Border.all(
        //   color: Colors.black,
        //   width: 1.0,
        // ),
        boxShadow: [BoxShadow(blurRadius: 10)],
        gradient: LinearGradient(colors: [
          Colors.white,
          Colors.white,
        ]),

        borderRadius: BorderRadius.circular(FixedHeight * 0.02),
      );
    }

    Decoration Main_White_Box_Inner_Gray_Box_Decoration() {
      return BoxDecoration(
        // border: Border.all(
        //   color: Colors.black,
        //   width: 1.0,
        // ),
        // boxShadow: [BoxShadow(blurRadius: 50)],
        color: Colors.grey,
        gradient: LinearGradient(colors: [Colors.black54, Colors.blueGrey]),
        borderRadius: BorderRadius.circular(10.0),
      );
    }

    Decoration Box_2_Gray_Decoration() {
      return BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1.0,
          ),
          color: Colors.white10,
          borderRadius: BorderRadius.circular(FixedHeight * 0.015));
    }

    return Column(
      children: [
        // Gray BOX 1
        SizedBox(height: FixedHeight * 0.01),
        Container(
          padding:
              EdgeInsets.fromLTRB(FixedHeight * 0.01, 0, FixedHeight * 0.02, 0),
          margin: EdgeInsets.fromLTRB(
              FixedHeight * 0.015, 0, FixedHeight * 0.015, 0),
          // width: FixedHeight*0.6,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white10,
                  offset: const Offset(
                    5.0,
                    1.0,
                  ),
                  blurRadius: 20.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                // BoxShadow(
                //   color: Colors.white12,
                //   offset: const Offset(0.0, 0.0),
                //   blurRadius: 0.0,
                //   spreadRadius: 0.0,
                // ),
              ],
              border: Border.all(
                color: Colors.black,
                width: 1.0,
              ),
              color: Colors.white10,
              borderRadius: BorderRadius.circular(FixedHeight * 0.015)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  //Kapas
                  buildRowComapreWidget('Coton Rate', inputkapas1, '₹/20kg',
                      FixedHeight, FixedWidth),

                  //Expense
                  buildRowComapreWidget('Expense', inputexpense1, '₹/20kg',
                      FixedHeight, FixedWidth),

                  //Cotton Seed
                  buildRowComapreWidget('Cotton Seed', inputkapasia1, '₹/20kg',
                      FixedHeight, FixedWidth),

                  //Out Turn
                  buildRowComapreWidget('Out Turn / Utaro', inpututaro1,
                      '₹/20kg', FixedHeight, FixedWidth),

                  //Shortage
                  buildRowComapreWidget('Shortage / Ghati', inputghati1,
                      '₹/20kg', FixedHeight, FixedWidth),
                ],
              ),
              SizedBox(width: FixedHeight * 0.01),
              Column(
                children: [
                  SizedBox(
                    height: FixedHeight * 0.01,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        FixedHeight * 0.0008,
                        FixedHeight * 0.002,
                        FixedHeight * 0.001,
                        FixedHeight * 0.012),
                    // margin: EdgeInsets.fromLTRB(0, 5, 0, 0),

                    width: FixedWidth * 0.27,
                    decoration: Main_White_Box_Decoration(),
                    child: Column(
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          height: FixedHeight * 0.005,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(
                              FixedHeight * 0.001,
                              FixedHeight * 0.004,
                              FixedHeight * 0.001,
                              FixedHeight * 0.01),
                          height: FixedHeight * 0.045,
                          width: FixedWidth * 0.25,
                          decoration:
                              Main_White_Box_Inner_Gray_Box_Decoration(),
                          child: StreamBuilder<int>(
                            stream:
                                result_addition_inputkapas1_and_inputexpense1
                                    .stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<int> snapshot1) {
                              if (snapshot1.hasData) {
                                return Text(
                                  '${snapshot1.data}' + ' ₹',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: FixedHeight * 0.028,
                                  ),
                                );
                              } else {
                                return Text('0');
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: FixedHeight * 0.01),
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        FixedHeight * 0.0008,
                        FixedHeight * 0.002,
                        FixedHeight * 0.001,
                        FixedHeight * 0.012),
                    width: FixedWidth * 0.27,
                    decoration: Main_White_Box_Decoration(),
                    child: Column(
                      children: [
                        Text(
                          'Kapas',
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          height: FixedHeight * 0.005,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(
                              FixedHeight * 0.001,
                              FixedHeight * 0.004,
                              FixedHeight * 0.001,
                              FixedHeight * 0.01),
                          height: FixedHeight * 0.045,
                          width: FixedWidth * 0.25,
                          decoration:
                              Main_White_Box_Inner_Gray_Box_Decoration(),
                          child: StreamBuilder<int>(
                            stream: result_final_output_padtar1.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<int> snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  '${snapshot.data}' + ' ₹',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: FixedHeight * 0.028,
                                      color: Colors.white),
                                );
                              } else {
                                return Text('0');
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: FixedHeight * 0.01),
                  Container(
                    height: FixedHeight * 0.045,
                    width: FixedWidth * 0.25,
                    child: ElevatedButton(
                        child: GradientText(
                          'Reset',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: FixedHeight * 0.025),
                          colors: [
                            Colors.blue,
                            Colors.red,
                            Colors.teal,
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(35, 35, 35, 0.9),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // <-- Radius
                          ),
                        ),
                        onPressed: () {
                          inputkapas1.clear();
                          inputexpense1.clear();
                          inputkapasia1.clear();
                          inpututaro1.clear();
                          inputghati1.clear();
                          result_output_difference.add(0);
                          focusnodekapas1.requestFocus();
                        }),
                  ),
                  SizedBox(height: FixedHeight * 0.02),
                ],
              )
            ],
          ),
        ),

        // Gray BOX 2
        SizedBox(height: FixedHeight * 0.01),
        Container(
          padding:
              EdgeInsets.fromLTRB(FixedHeight * 0.01, 0, FixedHeight * 0.02, 0),
          margin: EdgeInsets.fromLTRB(
              FixedHeight * 0.015, 0, FixedHeight * 0.015, 0),
          // width: FixedHeight*0.6,
          decoration: Box_2_Gray_Decoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  //Kapas
                  buildRowComapreWidget(
                      'Kapas', inputkapas2, '₹/20kg', FixedHeight, FixedWidth),
                  //Expense

                  buildRowComapreWidget('Expense', inputexpense2, '₹/20kg',
                      FixedHeight, FixedWidth),
                  //Cotton Seed

                  buildRowComapreWidget('Cotton Seed', inputkapasia2, '₹/20kg',
                      FixedHeight, FixedWidth),
                  //Out Turn

                  buildRowComapreWidget('Out Turn / Utaro', inpututaro2,
                      '₹/20kg', FixedHeight, FixedWidth),
                  //Shortage

                  buildRowComapreWidget('Shortage / Ghati', inputghati2,
                      '₹/20kg', FixedHeight, FixedWidth),
                ],
              ),
              SizedBox(width: FixedHeight * 0.01),
              Column(
                children: [
                  SizedBox(
                    height: FixedHeight * 0.01,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        FixedHeight * 0.0008,
                        FixedHeight * 0.002,
                        FixedHeight * 0.001,
                        FixedHeight * 0.012),
                    // margin: EdgeInsets.fromLTRB(0, 5, 0, 0),

                    width: FixedWidth * 0.27,
                    decoration: Main_White_Box_Decoration(),
                    child: Column(
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          height: FixedHeight * 0.005,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(
                              FixedHeight * 0.001,
                              FixedHeight * 0.004,
                              FixedHeight * 0.001,
                              FixedHeight * 0.01),
                          height: FixedHeight * 0.045,
                          width: FixedWidth * 0.25,
                          decoration:
                              Main_White_Box_Inner_Gray_Box_Decoration(),
                          child: StreamBuilder<int>(
                            stream:
                                result_addition_inputkapas2_and_inputexpense2
                                    .stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<int> snapshot9) {
                              if (snapshot9.hasData) {
                                return Text(
                                  '${snapshot9.data}' + ' ₹',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: FixedHeight * 0.028,
                                  ),
                                );
                              } else {
                                return Text('0');
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: FixedHeight * 0.02),

                  // Padtar Button 2
                  Container(
                    padding: EdgeInsets.fromLTRB(
                        FixedHeight * 0.0008,
                        FixedHeight * 0.002,
                        FixedHeight * 0.001,
                        FixedHeight * 0.012),
                    width: FixedWidth * 0.27,
                    decoration: Main_White_Box_Decoration(),
                    child: Column(
                      children: [
                        Text(
                          'Kapas',
                          style: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          height: FixedHeight * 0.005,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(
                              FixedHeight * 0.001,
                              FixedHeight * 0.004,
                              FixedHeight * 0.001,
                              FixedHeight * 0.01),
                          height: FixedHeight * 0.045,
                          width: FixedWidth * 0.25,
                          decoration:
                              Main_White_Box_Inner_Gray_Box_Decoration(),
                          child: StreamBuilder<int>(
                            stream: result_final_output_padtar2.stream,
                            builder: (BuildContext context,
                                AsyncSnapshot<int> snapshot10) {
                              if (snapshot10.hasData) {
                                return Text(
                                  '${snapshot10.data}' + ' ₹',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: FixedHeight * 0.028,
                                      color: Colors.white),
                                );
                              } else {
                                return Text('0');
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: FixedHeight * 0.01),
                  //Reset Button Box 2
                  Container(
                    height: FixedHeight * 0.045,
                    width: FixedWidth * 0.25,
                    child: ElevatedButton(
                        child: GradientText(
                          'Reset',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: FixedHeight * 0.025),
                          colors: [
                            Colors.blue,
                            Colors.red,
                            Colors.teal,
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(35, 35, 35, 0.9),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // <-- Radius
                          ),
                        ),
                        onPressed: () {
                          inputkapas2.clear();
                          inputexpense2.clear();
                          inputkapasia2.clear();
                          inpututaro2.clear();
                          inputghati2.clear();
                          result_output_difference.add(0);
                          focusnodekapas2.requestFocus();
                        }),
                  ),
                  SizedBox(height: FixedHeight * 0.008),
                ],
              )
            ],
          ),
        ),

        // Khandi Diffrnce
        SizedBox(height: FixedHeight * 0.015),
        Container(
          margin: EdgeInsets.fromLTRB(FixedWidth * 0.01, FixedHeight * 0.01,
              FixedWidth * 0.01, FixedHeight * 0.01),
          padding: EdgeInsets.fromLTRB(FixedWidth * 0.02, FixedHeight * 0.005,
              FixedWidth * 0.02, FixedHeight * 0.005),
          width: FixedWidth * 0.9,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 1.0,
            ),
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(FixedHeight * 0.02),
          ),
          child: Row(
            children: [
              Text(
                '',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      FixedHeight * 0.001,
                      FixedHeight * 0.004,
                      FixedHeight * 0.001,
                      FixedHeight * 0.01),
                  height: FixedHeight * 0.045,
                  width: FixedWidth * 0.6,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                    color: Colors.grey[350],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: StreamBuilder<int>(
                    stream: result_output_difference.stream,
                    builder:
                        (BuildContext context, AsyncSnapshot<int> snapshot6) {
                      if (snapshot6.hasData) {
                        return GradientText(
                          'Kapas Difference :- ' + '${snapshot6.data}' + ' ₹',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: FixedHeight * 0.03,
                              fontWeight: FontWeight.bold),
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
        SizedBox(height: FixedHeight * 0.02),
        Container(
          height: FixedHeight * 0.06,
          width: FixedWidth * 0.7,
          child: ElevatedButton(
              child: GradientText(
                'Reset All',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: FixedHeight * 0.025),
                colors: [
                  Colors.blue,
                  Colors.red,
                  Colors.teal,
                  Colors.red,
                  Colors.white,
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

                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => Home_Compare_Ginning_Calculator()));
              }),
        ),
      ],
    );
  }
}
