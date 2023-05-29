import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GlobalRowWidget extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final String subtitle;
  final double height;
  final double width;

  const GlobalRowWidget({
    required this.title,
    required this.controller,
    required this.subtitle,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0.007.sh, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 0.018.sh,
              ),
            ),
          ),
          SizedBox(width: 0.01.sw),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0.01.sw, 0, 0, 0),
                      height: height,
                      width: width,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1.1,
                        ),
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(0.02.sh),
                      ),
                      child: TextField(
                        textAlign: TextAlign.left,
                        controller: controller,
                        style:
                            TextStyle(fontSize: 0.025.sh, color: Colors.black),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () =>
                            FocusScope.of(context).nextFocus(),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 0.02.sw,
                ),
                Container(
                  width: 0.10.sh,
                  child: Text(
                    subtitle,
                    style: TextStyle(fontSize: 0.012.sh, color: Colors.black),
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
