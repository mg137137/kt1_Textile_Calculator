import 'dart:async';

import 'package:flutter/material.dart';

import '../../Globaly Accesible/Buttons.dart';
import '../../Globaly Accesible/Row widget with 3 items.dart';
import '../../Globaly Accesible/Screen Size Varibles.dart';
import '../../Globaly Accesible/Stream Builder For Results.dart';

class Loss_Yarn_Spinning_Calculator extends StatefulWidget {
  const Loss_Yarn_Spinning_Calculator({Key? key}) : super(key: key);

  @override
  State<Loss_Yarn_Spinning_Calculator> createState() =>
      _Loss_Yarn_Spinning_CalculatorState();
}

class _Loss_Yarn_Spinning_CalculatorState
    extends State<Loss_Yarn_Spinning_Calculator> {
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
    double FixedHeight = MediaQuery.of(context).size.height;
    double FixedWidth = MediaQuery.of(context).size.width;

    var result_final_output_padtar1;
    return Container(
        child: ListView(
      children: [
        // Yarn Count
        GlobalRowWidget(
          height: Global_Singal_Textfied_Height,
          width: Global_Singal_Textfied_Width,
          title: 'Yarn Count',
          controller: inputghati1,
          subtitle: '',
        ),

        //Cotton Rate
        GlobalRowWidget(
          height: Global_Singal_Textfied_Height,
          width: Global_Singal_Textfied_Width,
          title: 'Cotton Rate',
          controller: inputexpense1,
          subtitle: '₹/Bale',
        ),

        //  Result Cotton Rate
        Global_Stream_Builder_For_Results_View_Only_Without_Result(
          stream: "result_final_output_padtar1.stream",
          substreamtext: '',
          streamtitletext: 'Cotton Rate ',
        ),

        // Yield
        GlobalRowWidget(
          height: Global_Singal_Textfied_Height,
          width: Global_Singal_Textfied_Width,
          title: 'Yield',
          controller: inputexpense1,
          subtitle: 'Percentage %',
        ),

        // Waste Recovery
        GlobalRowWidget(
          height: Global_Singal_Textfied_Height,
          width: Global_Singal_Textfied_Width,
          title: 'Waste Recovery',
          controller: inputexpense1,
          subtitle: '₹/kg',
        ),

        // Material Coast
        Global_Stream_Builder_For_Results_View_Only_Without_Result(
          stream: "result_final_output_padtar1.stream",
          substreamtext: '',
          streamtitletext: 'Material Coast',
        ),

        // Coversation Coast
        GlobalRowWidget(
          height: Global_Singal_Textfied_Height,
          width: Global_Singal_Textfied_Width,
          title: 'Coversation Coast',
          controller: inputexpense1,
          subtitle: '₹/kg/Count',
        ),

        // Commission
        GlobalRowWidget(
          height: Global_Singal_Textfied_Height,
          width: Global_Singal_Textfied_Width,
          title: 'Commission',
          controller: inputexpense1,
          subtitle: 'Percentage %',
        ),

        // Other Expense
        GlobalRowWidget(
          height: Global_Singal_Textfied_Height,
          width: Global_Singal_Textfied_Width,
          title: 'Other Expense',
          controller: inputghati1,
          subtitle: '₹/kg',
        ),

        //Yarn Coast
        Global_Stream_Builder_For_Results_View_Only_Without_Result(
          stream: "result_final_output_padtar1.stream",
          substreamtext: '',
          streamtitletext: 'Yarn Coast',
        ),

        //Yarn Rate
        GlobalRowWidget(
          height: Global_Singal_Textfied_Height,
          width: Global_Singal_Textfied_Width,
          title: 'Yarn Rate',
          controller: inputghati1,
          subtitle: '₹/kg',
        ),

        //Loss
        GlobalRowWidget(
          height: Global_Singal_Textfied_Height,
          width: Global_Singal_Textfied_Width,
          title: 'Loss',
          controller: inputghati1,
          subtitle: '₹/kg',
        ),

        //  Result Cotton Coast
        Global_Stream_Builder_For_Results_View_Only_Without_Result(
          stream: "result_final_output_padtar1.stream",
          substreamtext: '',
          streamtitletext: 'Cotton Coast',
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
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => Home_Compare_Ginning_Calculator(
            //       for_or_reverse: true,
            //     ),
            //   ),
            // );
          },
          buttontext: 'Compare',
          height: Global_Singal_Comare_Button_Height,
          width: Global_Singal_Comare_Button_Width,
        ),
      ],
    ));
  }
}
