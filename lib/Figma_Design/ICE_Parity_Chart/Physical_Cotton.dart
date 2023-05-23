import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../Globle_Access_Variables.dart';
import '../Ginning_Calculator/Compare_Ginning_Calculator/Home_Compare_Ginning_Calculator.dart';

class Physical_Cotton extends StatefulWidget {
  const Physical_Cotton({Key? key}) : super(key: key);

  @override
  State<Physical_Cotton> createState() => _Physical_CottonState();
}

class _Physical_CottonState extends State<Physical_Cotton> {
  void _updateValues_for_calculator1() {
    double store_input_kapas1 = double.tryParse(inputkapas1.text) ?? 0;
    double store_input_expense1 = double.tryParse(inputexpense1.text) ?? 0;
    double store_input_kapasia1 = double.tryParse(inputkapasia1.text) ?? 0;
    double store_input_utaro1 = double.tryParse(inpututaro1.text) ?? 0;
    double store_input_ghati1 = double.tryParse(inputghati1.text) ?? 0;
    int sum1 = (store_input_kapas1 + store_input_expense1).round().toInt();
    result_addition_inputkapas1_and_inputexpense1.add(sum1);
    double a = sum1 * 100;
    double b = 100 - store_input_utaro1 - store_input_ghati1;
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
    //
    // double FixedHeight_InputField_Container = FixedHeight * 0.05;
    // double FixedWidth_InputField_Container = FixedHeight * 0.17;
    //
    //
    // double FixedWidth_Padding_Input_Field_Sub_Text = FixedHeight * 0.02;

    Decoration Input_Field_Gray_Container_Background() {
      return BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1.1,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      );
    }

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double FixedHeight = MediaQuery.of(context).size.height;
        double FixedWidth = constraints.maxWidth;
        //
        // double FixedHeight_Between_Input_Text_Field = FixedHeight * 0.008;
        return Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.fromLTRB(0.08.sw, 0.01.sh, 0.01.sw, 0.01.sh),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Cotton Rate
                    buildRowWidget('Cotton Rate', inputkapas1, '₹/Bale',
                        FixedHeight, FixedWidth),

                    // ICE Future Rate
                    buildRowWidget('ICE Future Rate', inputexpense1, 'Cents/lb',
                        FixedHeight, FixedWidth),

                    // Exchange Rate
                    buildRowWidget('Exchange Rate', inputkapasia1, 'Cents/lb',
                        FixedHeight, FixedWidth),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(FixedWidth * 0.01,
                    FixedHeight * 0.01, FixedWidth * 0.01, FixedHeight * 0.01),
                padding: EdgeInsets.fromLTRB(
                    FixedWidth * 0.02,
                    FixedHeight * 0.005,
                    FixedWidth * 0.02,
                    FixedHeight * 0.005),
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
                      'Parity ',
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
                          stream: result_final_output_padtar11.stream,
                          builder: (BuildContext context,
                              AsyncSnapshot<int> snapshot) {
                            if (snapshot.hasData) {
                              return GradientText(
                                '${snapshot.data}' + ' Cents/lb',
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Home_Compare_Ginning_Calculator(
                                    for_or_reverse: true,
                                  )));
                    }),
              ),
            ],
          ),
        );
      },
    );
  }
}
