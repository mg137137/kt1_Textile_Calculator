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
      margin: EdgeInsets.fromLTRB(50.w, 20.h, 50.w, 0),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Title
          Container(
            width: 600.w,
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 50.sp,
              ),
            ),
          ),

          //Text field
          Row(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
                alignment: Alignment.centerLeft,
                height: 120.h,
                width: 400.w,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.1,
                  ),
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(70.sp),
                ),
                child: TextField(
                  // textAlign: TextAlign.center,
                  controller: controller,
                  style: TextStyle(fontSize: 65.sp, color: Colors.black),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
                ),
              ),

              SizedBox(
                width: 20.sp,
              ),
              //sub text
              Container(
                width: 200.w,
                child: Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 0.012.sh, color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
