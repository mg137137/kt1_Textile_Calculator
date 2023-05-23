import 'dart:async';

import 'package:flutter/material.dart';

class Old_Version_1_Application extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

final Decoration Bluebox_Decoration = BoxDecoration(
    gradient: const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color.fromRGBO(93, 43, 43, 0.7019607843137254),
        Color.fromRGBO(154, 125, 125, 0.7019607843137254),
      ],
    ),
    boxShadow: [
      BoxShadow(
        offset: const Offset(4, 5),
        blurRadius: 5,
        color: Colors.brown.withOpacity(0.7),
      ),
    ],
    borderRadius: BorderRadius.circular(10),
    color: Colors.white);

class _MyWidgetState extends State<Old_Version_1_Application> {
  // for calculator 1
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
    int sum1 = (store_input_kapas1 + store_input_expense1).round().toInt();
    result_addition_inputkapas1_and_inputexpense1.add(sum1);
    double a = sum1 * 100;
    double b = 100 - store_input_utaro1 - (store_input_ghati1);
    double c = store_input_kapasia1 * b;
    double d = a - c;
    double e = d / store_input_utaro1;
    double f = e * 17.78;
    diff1 = f;
    int sum2 = f.round().toInt();
    result_final_output_padtar1.add(sum2);

    setState(() {
      result_input_kapas1_and_expense1 = sum1.toString();
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

    double a = sum1 * 100;
    double b = 100 - store_input_utaro2 - (store_input_ghati2);
    double c = store_input_kapasia2 * b;
    double d = a - c;
    double e = d / store_input_utaro2;
    double f = e * 17.78;
    diff2 = f;
    int sum2 = f.round().toInt();
    result_final_output_padtar2.add(sum2);

    setState(() {
      result_output_padtar2 = f.toString();
      result_input_kapas2_and_expense2 = sum1.toString();

      int diff = (diff1 - diff2).round().toInt();

      result_output_difference.add(diff);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 1, 5, 0),
            child: Container(
              child: AppBar(
                backgroundColor: Color.fromRGBO(93, 43, 43, 0.9),
                centerTitle: true,
                automaticallyImplyLeading: false,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(10), top: Radius.circular(10)),
                ),
                title: const Text(
                  'Ginning Calculator',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.65,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/technology.png'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.05),
                      BlendMode.dstIn,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white12,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(1, 1),
                      blurRadius: 3,
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 5, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Text calulator 1 and calculator 2
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            height: 40,
                            width: 110,
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            height: 40,
                            width: 110,
                            child: const Text(
                              'Calculator 1',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 110,
                            child: const Text(
                              'Calculator 2',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),

                      //input kapas Text and 2 box kapas1 kapas2
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            height: 40,
                            width: 110,
                            child: const Text(
                              'Kapas:- ',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 110,
                            child: TextField(
                              controller: inputkapas1,
                              focusNode: focusnodekapas1,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                  fontSize: 20,
                                  height: 1.3,
                                  color: Colors.black),
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Color.fromRGBO(255, 255, 255, 0.9),
                                border: InputBorder.none,

                                contentPadding: EdgeInsets.fromLTRB(5, 1, 0, 1),
                                // border: OutlineInputBorder(
                                //     borderSide: BorderSide(color: Colors.red),
                                //     borderRadius: BorderRadius.circular(10),
                                // ),

                                isDense: true,
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 110,
                            child: TextField(
                              controller: inputkapas2,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              focusNode: focusnodekapas2,
                              style: const TextStyle(
                                  fontSize: 20,
                                  height: 1.3,
                                  color: Colors.black),
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Color.fromRGBO(255, 255, 255, 0.9),
                                border: InputBorder.none,

                                contentPadding: EdgeInsets.fromLTRB(5, 1, 0, 1),
                                // border: OutlineInputBorder(
                                //     borderSide: BorderSide(color: Colors.red),
                                //     borderRadius: BorderRadius.circular(10),
                                // ),

                                isDense: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                      //input Expense Text and 2 box expense1 expense2
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            height: 40,
                            width: 110,
                            child: const Text(
                              'Expenses:- ',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 110,
                            // decoration:userinputtext,

                            child: TextField(
                              controller: inputexpense1,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                  fontSize: 20,
                                  height: 1.3,
                                  color: Colors.black),
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Color.fromRGBO(255, 255, 255, 0.9),
                                border: InputBorder.none,

                                contentPadding: EdgeInsets.fromLTRB(5, 1, 0, 1),
                                // border: OutlineInputBorder(
                                //     borderSide: BorderSide(color: Colors.red),
                                //     borderRadius: BorderRadius.circular(10),
                                // ),

                                isDense: true,
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 110,
                            child: TextField(
                              controller: inputexpense2,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                  fontSize: 20,
                                  height: 1.3,
                                  color: Colors.black),
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Color.fromRGBO(255, 255, 255, 0.9),
                                border: InputBorder.none,

                                contentPadding: EdgeInsets.fromLTRB(5, 1, 0, 1),
                                // border: OutlineInputBorder(
                                //     borderSide: BorderSide(color: Colors.red),
                                //     borderRadius: BorderRadius.circular(10),
                                // ),

                                isDense: true,
                              ),
                            ),
                          ),
                        ],
                      ),

                      //output Total Text and 2 box total1 total2
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            height: 30,
                            width: 110,
                            child: const Text(
                              'Total :- ',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 110,
                            decoration: Bluebox_Decoration,
                            child: StreamBuilder<int>(
                              stream:
                                  result_addition_inputkapas1_and_inputexpense1
                                      .stream,
                              builder: (BuildContext context,
                                  AsyncSnapshot<int> snapshot1) {
                                if (snapshot1.hasData) {
                                  return Text(
                                    '${snapshot1.data}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  );
                                } else {
                                  return Text('0');
                                }
                              },
                            ),
                          ),
                          Container(
                            decoration: Bluebox_Decoration,
                            height: 30,
                            width: 110,
                            child: StreamBuilder<int>(
                              stream:
                                  result_addition_inputkapas2_and_inputexpense2
                                      .stream,
                              builder: (BuildContext context,
                                  AsyncSnapshot<int> snapshot4) {
                                if (snapshot4.hasData) {
                                  return Text(
                                    '${snapshot4.data}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
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

                      //input Kapasia Text and 2 box kapasia1 kapasia2
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              height: 40,
                              width: 110,
                              child: const Text(
                                'Kapasia:- ',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 110,
                              child: TextField(
                                controller: inputkapasia1,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                style: const TextStyle(
                                    fontSize: 20,
                                    height: 1.3,
                                    color: Colors.black),
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromRGBO(255, 255, 255, 0.7),
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.fromLTRB(5, 1, 0, 1),
                                  isDense: true,
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 110,
                              child: TextField(
                                controller: inputkapasia2,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.next,
                                style: const TextStyle(
                                    fontSize: 20,
                                    height: 1.3,
                                    color: Colors.black),
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromRGBO(255, 255, 255, 0.7),
                                  border: InputBorder.none,

                                  contentPadding:
                                      EdgeInsets.fromLTRB(5, 1, 0, 1),
                                  // border: OutlineInputBorder(
                                  //     borderSide: BorderSide(color: Colors.red),
                                  //     borderRadius: BorderRadius.circular(10),
                                  // ),

                                  isDense: true,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //input utaro Text and 2 box utaro1 utaro2
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            height: 40,
                            width: 110,
                            child: const Text(
                              'Utaro:- ',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 110,
                            child: TextField(
                              controller: inpututaro1,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              style: const TextStyle(
                                  fontSize: 20,
                                  height: 1.3,
                                  color: Colors.black),
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Color.fromRGBO(255, 255, 255, 0.7),
                                border: InputBorder.none,

                                contentPadding: EdgeInsets.fromLTRB(5, 1, 0, 1),
                                // border: OutlineInputBorder(
                                //     borderSide: BorderSide(color: Colors.red),
                                //     borderRadius: BorderRadius.circular(10),
                                // ),

                                isDense: true,
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 110,
                            child: TextField(
                              controller: inpututaro2,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              style: const TextStyle(
                                  fontSize: 20,
                                  height: 1.3,
                                  color: Colors.black),
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Color.fromRGBO(255, 255, 255, 0.7),
                                border: InputBorder.none,

                                contentPadding: EdgeInsets.fromLTRB(5, 1, 0, 1),
                                // border: OutlineInputBorder(
                                //     borderSide: BorderSide(color: Colors.red),
                                //     borderRadius: BorderRadius.circular(10),
                                // ),

                                isDense: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                      //input ghati Text and 2 box ghati1 ghati2
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            height: 40,
                            width: 110,
                            child: const Text(
                              'Ghati:- ',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 110,

                            // decoration:userinputtext,

                            child: TextField(
                              controller: inputghati1,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  fontSize: 20,
                                  height: 1.3,
                                  color: Colors.black),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromRGBO(255, 255, 255, 0.7),
                                border: InputBorder.none,

                                contentPadding: EdgeInsets.fromLTRB(5, 1, 0, 1),
                                // border: OutlineInputBorder(
                                //     borderSide: BorderSide(color: Colors.red),
                                //     borderRadius: BorderRadius.circular(10),
                                // ),

                                isDense: true,
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 110,
                            child: TextField(
                              controller: inputghati2,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              style: TextStyle(
                                  fontSize: 20,
                                  height: 1.3,
                                  color: Colors.black),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color.fromRGBO(255, 255, 255, 0.7),
                                border: InputBorder.none,

                                contentPadding: EdgeInsets.fromLTRB(5, 1, 0, 1),
                                // border: OutlineInputBorder(
                                //     borderSide: BorderSide(color: Colors.red),
                                //     borderRadius: BorderRadius.circular(10),
                                // ),

                                isDense: true,
                              ),
                            ),
                          ),
                        ],
                      ),

                      //output padtar Text and 2 box padtar1 padtar2
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            height: 30,
                            width: 110,
                            child: const Text(
                              'Padatar :- ',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 110,
                            decoration: Bluebox_Decoration,
                            child: StreamBuilder<int>(
                              stream: result_final_output_padtar1.stream,
                              builder: (BuildContext context,
                                  AsyncSnapshot<int> snapshot) {
                                if (snapshot.hasData) {
                                  return Text(
                                    '${snapshot.data}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  );
                                } else {
                                  return Text('0');
                                }
                              },
                            ),
                          ),
                          Container(
                            decoration: Bluebox_Decoration,
                            height: 30,
                            width: 110,
                            child: StreamBuilder<int>(
                              stream: result_final_output_padtar2.stream,
                              builder: (BuildContext context,
                                  AsyncSnapshot<int> snapshot3) {
                                if (snapshot3.hasData) {
                                  return Text(
                                    '${snapshot3.data}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
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

                      //output Khandi Difference
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              height: 30,
                              width: 200,
                              child: Text(
                                'Khandi Differnce:- ',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Container(
                                height: 30,
                                width: 120,
                                alignment: Alignment.center,
                                decoration: Bluebox_Decoration,
                                child: StreamBuilder<int>(
                                  stream: result_output_difference.stream,
                                  builder: (BuildContext context,
                                      AsyncSnapshot<int> snapshot6) {
                                    if (snapshot6.hasData) {
                                      return Text(
                                        '${snapshot6.data}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                        ),
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

                      // Reset Button 1,2 and all
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
                              decoration: BoxDecoration(),
                              height: 40,
                              width: 120,
                              child: ElevatedButton(
                                child: Text(
                                  'RESET ALL',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 12),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromRGBO(93, 43, 43, 0.9),
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
                                  inputkapas2.clear();
                                  inputexpense2.clear();
                                  inputkapasia2.clear();
                                  inpututaro2.clear();
                                  inputghati2.clear();
                                  result_output_difference.add(0);
                                  focusnodekapas1.requestFocus();
                                },
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
                              height: 40,
                              width: 120,
                              child: ElevatedButton(
                                child: Text(
                                  'RESET CAL.1',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromRGBO(93, 43, 43, 0.9),
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
                                },
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
                              height: 40,
                              width: 120,
                              child: ElevatedButton(
                                child: Text(
                                  'RESET CAL.2',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 12),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromRGBO(93, 43, 43, 0.9),
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
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
