import 'dart:async';

import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../Globaly Accesible/Row widget with 3 items.dart';
import '../../../Globaly Accesible/Screen Size Varibles.dart';

class Forward_Singal_Oil_Mill_Calculator extends StatefulWidget {
  const Forward_Singal_Oil_Mill_Calculator({Key? key}) : super(key: key);

  @override
  State<Forward_Singal_Oil_Mill_Calculator> createState() =>
      _Forward_Singal_Oil_Mill_CalculatorState();
}

class _Forward_Singal_Oil_Mill_CalculatorState
    extends State<Forward_Singal_Oil_Mill_Calculator> {
  void _updateValues_for_calculator1() {
    double store_input_kapas1 = double.tryParse(inputkapas1.text) ?? 0;
    double store_input_expense1 = double.tryParse(inputexpense1.text) ?? 0;
    double store_input_kapasia1 = double.tryParse(inputkapasia1.text) ?? 0;
    double store_input_utaro1 = double.tryParse(inpututaro1.text) ?? 0;
    double store_input_ghati1 = double.tryParse(inputghati1.text) ?? 0;
    int sum1 = (store_input_kapas1 + store_input_expense1).round().toInt();
    result_addition_inputkapas1_and_inputexpense1.add(sum1);
    double a = sum1 * 100;
    double b = 100 - store_input_utaro1 - (store_input_ghati1);
    double c = store_input_kapasia1 * b;
    double d = a - c;
    double e = d / store_input_utaro1;
    double f = e * 17.78;
    int sum2 = f.round().toInt();
    diff1 = f;
    result_final_output_padtar11.add(sum2);
    setState(() {
      result_input_kapas1_and_expense1 = sum1.toString();
      result_output_padtar1 = result_final_output_padtar11.toString();
    });
  }

  StreamController<int> result_addition_inputkapas1_and_inputexpense1 =
      StreamController<int>();

  StreamController<int> result_final_output_padtar11 = StreamController<int>();

  String result_input_kapas1_and_expense1 = "0";
  String result_output_padtar1 = "0";

  double diff1 = 0;

  // for focusing  a node
  FocusNode focusnodekapas1 = FocusNode();

  final inputkapas1 = TextEditingController();
  final inputexpense1 = TextEditingController();
  final inputkapasia1 = TextEditingController();
  final inpututaro1 = TextEditingController();
  final inputghati1 = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    result_addition_inputkapas1_and_inputexpense1.add(0);
    result_final_output_padtar11.add(0);

    inputkapas1.addListener(_updateValues_for_calculator1);
    inputexpense1.addListener(_updateValues_for_calculator1);
    inputkapasia1.addListener(_updateValues_for_calculator1);
    inpututaro1.addListener(_updateValues_for_calculator1);
    inputghati1.addListener(_updateValues_for_calculator1);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    inputkapas1.dispose();
    inputexpense1.dispose();
    inputkapasia1.dispose();
    inpututaro1.dispose();
    inputghati1.dispose();

    result_addition_inputkapas1_and_inputexpense1.close();
    result_final_output_padtar11.close();
  }

  @override
  Widget build(BuildContext context) {
    double FixedHeight = MediaQuery.of(context).size.height;
    double FixedWidth = MediaQuery.of(context).size.width;
    double FixedHeight_InputField_Container =
        MediaQuery.of(context).size.height * 0.045;
    double FixedWidth_InputField_Container =
        MediaQuery.of(context).size.width * 0.25;

    TextStyle Title_Column_textStyle() {
      // Like kapas,Expense.....
      return TextStyle(
          fontSize: FixedHeight * 0.023, fontWeight: FontWeight.bold);
    }

    return Container(
      child: Column(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Kapas
                GlobalRowWidget(
                  height: Global_Singal_Textfied_Height,
                  width: Global_Singal_Textfied_Width,
                  title: 'Cotton Seed',
                  controller: inputkapas1,
                  subtitle: '₹/20kg',
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
                  title: 'Oil Rate',
                  controller: inputkapasia1,
                  subtitle: '₹/20kg',
                ),

                // Out Turn / Utaro
                GlobalRowWidget(
                  height: Global_Singal_Textfied_Height,
                  width: Global_Singal_Textfied_Width,
                  title: 'Oil',
                  controller: inpututaro1,
                  subtitle: 'Percentage %',
                ),

                // Shortage / Ghati
                GlobalRowWidget(
                  height: Global_Singal_Textfied_Height,
                  width: Global_Singal_Textfied_Width,
                  title: 'Oil Cake',
                  controller: inpututaro1,
                  subtitle: 'Percentage %',
                ),

                //Packing Size
                GlobalRowWidget(
                  height: Global_Singal_Textfied_Height,
                  width: Global_Singal_Textfied_Width,
                  title: 'Packing Size',
                  controller: inputghati1,
                  subtitle: 'Kgs.',
                ),
              ],
            ),
          ),
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
                  'Oil Cake Cost',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(
                  width: FixedWidth * 0.02,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                        FixedHeight * 0.001,
                        FixedHeight * 0.001,
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
                      stream: result_final_output_padtar11.stream,
                      builder:
                          (BuildContext context, AsyncSnapshot<int> snapshot) {
                        if (snapshot.hasData) {
                          return GradientText(
                            '${snapshot.data}' + ' ₹/20Kg',
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
          Container(
            margin: EdgeInsets.only(bottom: FixedHeight * 0.01),
            height: FixedHeight * 0.04,
            width: FixedWidth * 0.4,
            child: ElevatedButton(
                child: Text(
                  'Reset',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: FixedHeight * 0.025),
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
          SizedBox(height: FixedHeight * 0.005),
          Container(
            height: FixedHeight * 0.05,
            width: FixedHeight * 0.4,
            child: ElevatedButton(
                child: GradientText(
                  'Compare',
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
                    borderRadius: BorderRadius.circular(10), // <-- Radius
                  ),
                ),
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             Home_Compare_Ginning_Calculator(
                  //               for_or_reverse: true,
                  //             )));
                }),
          ),
        ],
      ),
    );
  }
}
