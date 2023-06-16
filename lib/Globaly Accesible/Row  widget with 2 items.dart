import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class GlobalRowCompareWidget extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final String subtitle;
  final double height;
  final double width;

  const GlobalRowCompareWidget({
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
            width: 500.w,
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

          //Text field 1
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            alignment: Alignment.centerLeft,
            height: 120.h,
            width: 400.w,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 5.sp,
              ),
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(70.sp),
            ),
            child: TextField(
              // textAlign: TextAlign.center,
              maxLines: 1,
              textAlign: TextAlign.left,
              controller: controller,
              cursorColor: Colors.black,
              cursorHeight: 60.sp,
              style: TextStyle(fontSize: 60.sp, color: Colors.black),
              decoration: InputDecoration(
                // fillColor: Colors.red,
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(70.sp)),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              textInputAction: TextInputAction.next,
              onEditingComplete: () => FocusScope.of(context).nextFocus(),
            ),
          ),
        ],
      ),
    );
  }
}

class GlobalRowCompareWidget2textfiels extends StatelessWidget {
  final String title;
  final TextEditingController controller1;
  final TextEditingController controller2;
  final String subtitle;
  final double height;
  final double width;

  const GlobalRowCompareWidget2textfiels({
    required this.title,
    required this.controller1,
    required this.subtitle,
    required this.height,
    required this.width,
    required this.controller2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(50.w, 20.h, 50.w, 0),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Title
          Container(
            width: 500.w,
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

          //Text field 1
          Container(
            padding: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
            alignment: Alignment.centerLeft,
            height: 120.h,
            width: 400.w,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 5.sp,
              ),
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(70.sp),
            ),
            child: TextField(
              textAlign: TextAlign.left,
              controller: controller1,
              cursorColor: Colors.black,
              cursorHeight: 60.sp,
              style: TextStyle(fontSize: 60.sp, color: Colors.black),
              decoration: InputDecoration(
                // hintText: subtitle,
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              textInputAction: TextInputAction.next,
              onEditingComplete: () => FocusScope.of(context).nextFocus(),
            ),
          ),

          //Text field 2
          Container(
            padding: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
            alignment: Alignment.centerLeft,
            height: 120.h,
            width: 400.w,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 5.sp,
              ),
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(70.sp),
            ),
            child: TextField(
              textAlign: TextAlign.left,
              controller: controller2,
              cursorColor: Colors.black,
              cursorHeight: 60.sp,
              style: TextStyle(fontSize: 60.sp, color: Colors.black),
              decoration: InputDecoration(
                // hintText: subtitle,
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              textInputAction: TextInputAction.next,
              onEditingComplete: () => FocusScope.of(context).nextFocus(),
            ),
          ),
        ],
      ),
    );
  }
}

class GlobalRowCompareWidget2TEXT extends StatelessWidget {
  final String title1;
  final String title2;

  const GlobalRowCompareWidget2TEXT(
      {required this.title1, required this.title2});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(50.w, 20.h, 50.w, 0),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Title
          Container(
            width: 500.w,
          ),

          //Text field 1
          Container(
            padding: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
            alignment: Alignment.center,
            height: 120.h,
            width: 400.w,
            child: Text(
              title1,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 50.sp,
              ),
            ),
          ),

          //Text field 2
          Container(
            padding: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
            alignment: Alignment.center,
            height: 120.h,
            width: 400.w,
            child: Text(
              title2,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 50.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GlobalRowCompareWidget2Button extends StatelessWidget {
  final VoidCallback onpressed1;
  final VoidCallback onpressed2;
  final String text1;
  final String text2;

  const GlobalRowCompareWidget2Button(
      {required this.onpressed1,
      required this.onpressed2,
      required this.text1,
      required this.text2});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(50.w, 20.h, 50.w, 0),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Title
          Container(
            width: 500.w,
          ),

          //Text field 1
          Container(
            height: 120.h,
            width: 400.w,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onpressed1,
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.sp),
                    color: Color.fromRGBO(35, 35, 35, 0.9),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: GradientText(
                      text1,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 40.sp, fontWeight: FontWeight.bold),
                      colors: [
                        Colors.white,
                        Colors.white,
                        Colors.white,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          //Text field 2
          Container(
            height: 120.h,
            width: 400.w,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onpressed2,
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40.sp),
                    color: Color.fromRGBO(35, 35, 35, 0.9),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: GradientText(
                      text2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 40.sp, fontWeight: FontWeight.bold),
                      colors: [
                        Colors.white,
                        Colors.white,
                        Colors.white,
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GlobalRowCompareWidget2StreamBuilder extends StatelessWidget {
  final Stream<double> stream1;
  final Stream<double> stream2;
  final String title1;
  final String title2;
  final String subtext1;
  final String subtext2;

  const GlobalRowCompareWidget2StreamBuilder(
      {required this.stream1,
      required this.stream2,
      required this.subtext1,
      required this.subtext2,
      required this.title1,
      required this.title2});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(50.w, 20.h, 50.w, 0),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Title
          Container(
            width: 500.w,
            child: Text(
              title1,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 60.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),

          //Text field 1
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            alignment: Alignment.center,
            height: 110.h,
            width: 400.w,
            decoration: BoxDecoration(
              // border: Border.all(
              //   color: Colors.black,
              //   width: 1.0,
              // ),
              // boxShadow: [BoxShadow(blurRadius: 50)],
              color: Colors.grey,
              gradient:
                  LinearGradient(colors: [Colors.black54, Colors.blueGrey]),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: StreamBuilder<double>(
              stream: stream1,
              builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
                if (snapshot.hasData) {
                  return Tooltip(
                    message: '${snapshot.data}' + ' $subtext1',
                    child: Text(
                      '${snapshot.data}' + ' $subtext1',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 60.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  );
                } else {
                  return Text('0');
                }
              },
            ),
          ),

          //Text field 2
          Container(
            padding: EdgeInsets.fromLTRB(0.w, 0, 0, 0),
            alignment: Alignment.center,
            height: 110.h,
            width: 400.w,
            decoration: BoxDecoration(
              color: Colors.grey,
              gradient:
                  LinearGradient(colors: [Colors.black54, Colors.blueGrey]),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: StreamBuilder<double>(
              stream: stream2,
              builder: (BuildContext context, AsyncSnapshot<double> snapshot2) {
                if (snapshot2.hasData) {
                  return Tooltip(
                    message: '${snapshot2.data}' + ' $subtext2',
                    child: Text(
                      '${snapshot2.data}' + ' $subtext2',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 60.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
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
    );
  }
}
