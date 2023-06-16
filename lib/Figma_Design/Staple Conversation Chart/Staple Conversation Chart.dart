import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Globaly Accesible/Globle_Access_Variables.dart';

class Staple_Conversation_Chart extends StatefulWidget {
  @override
  _Staple_Conversation_ChartState createState() =>
      _Staple_Conversation_ChartState();
}

class _Staple_Conversation_ChartState extends State<Staple_Conversation_Chart> {
  List<Item> _items = generateItems(5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Staple Conversation Chart',
            style: TextStyle(
                fontSize: 70.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(150.sp),
          ),
        ),
        backgroundColor: Universal_Gray,
        elevation: 2,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(
              80.w,
              10.h,
              80.w,
              10.h,
            ),
            // color: Colors.red,
            height: 150.h,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    'Inches',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 60.sp,
                        color: Colors.black),
                  ),
                ),
                Container(
                  child: Text(
                    'MM',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 60.sp,
                        color: Colors.black),
                  ),
                ),
                Container(
                  child: Text(
                    '32nd',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 60.sp,
                        color: Colors.black),
                  ),
                ),
                Container(
                  child: Text(
                    'Decimal',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 60.sp,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: ExpansionPanelList(
                    elevation: 1,
                    expandedHeaderPadding: EdgeInsets.all(0),
                    expansionCallback: (int index, bool isExpanded) {
                      setState(() {
                        _items[index].isExpanded = !isExpanded;
                      });
                    },
                    children: _items.map<ExpansionPanel>((Item item) {
                      return ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            title: Text(item.headerValue),
                          );
                        },
                        body: ListTile(
                          title: Text(item.expandedValue),
                        ),
                        isExpanded: item.isExpanded,
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int count) {
  return List<Item>.generate(count, (int index) {
    return Item(
      headerValue: 'Button ${index + 1}',
      expandedValue: 'Content for Button ${index + 1}',
    );
  });
}
