import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class spinning_answer_With_Stream_Builder extends StatelessWidget {
  // final Stream<double> stream1;

  final String stream;

  final String title;

  final String subtext;

  const spinning_answer_With_Stream_Builder({
    Key? key,
    required this.stream,
    required this.title,
    required this.subtext,
  }) : super(key: key);

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
              style: TextStyle(
                  fontSize: 50.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),

          //Text field
          Row(
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(20.w, 0, 0, 0),
                  alignment: Alignment.center,
                  height: 120.h,
                  width: 400.w,
                  decoration: BoxDecoration(
                    // border: Border.all(
                    //   color: Colors.black,
                    //   width: 1.0,
                    // ),
                    // boxShadow: [BoxShadow(blurRadius: 50)],
                    color: Colors.grey,
                    gradient: LinearGradient(
                        colors: [Colors.black54, Colors.blueGrey]),
                    borderRadius: BorderRadius.circular(10.0),
                  )
                  // child: StreamBuilder<double>(
                  //   stream: stream1,
                  //   builder:
                  //       (BuildContext context, AsyncSnapshot<double> snapshot) {
                  //     if (snapshot.hasData) {
                  //       return Tooltip(
                  //         message: '${snapshot.data}' + ' $subtext1',
                  //         child: Text(
                  //           '${snapshot.data}' + ' $subtext1',
                  //           maxLines: 1,
                  //           overflow: TextOverflow.ellipsis,
                  //           textAlign: TextAlign.center,
                  //           style: TextStyle(
                  //               fontSize: 60.sp,
                  //               color: Colors.white,
                  //               fontWeight: FontWeight.bold),
                  //         ),
                  //       );
                  //     } else {
                  //       return Text('0');
                  //     }
                  //   },
                  // ),
                  ),

              SizedBox(
                width: 20.sp,
              ),
              //sub text
              Container(
                width: 200.w,
                // child: Text(''),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
