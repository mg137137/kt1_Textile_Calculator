import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Global_Stream_Builder_For_Results extends StatelessWidget {
  final Stream<double> stream;
  final String substreamtext;
  final String streamtitletext;

  const Global_Stream_Builder_For_Results(
      {super.key,
      required this.stream,
      required this.substreamtext,
      required this.streamtitletext});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(100.w, 20.h, 100.w, 0),
      padding: EdgeInsets.fromLTRB(20.w, 10.h, 10.w, 10.h),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        ),
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(50.sp),
      ),
      child: Row(
        children: [
          Text(
            streamtitletext,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 50.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          SizedBox(
            width: 40.w,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              height: 120.h,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
                color: Colors.grey[350],
                borderRadius: BorderRadius.circular(40.sp),
              ),
              child: StreamBuilder<double>(
                stream: stream,
                builder:
                    (BuildContext context, AsyncSnapshot<double> snapshot) {
                  if (snapshot.hasData) {
                    return Tooltip(
                      message: '${snapshot.data}' ' $substreamtext',
                      child: GradientText(
                        '${snapshot.data}' ' $substreamtext',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 70.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        colors: const [
                          Colors.black,
                          Colors.teal,
                          Colors.red,
                        ],
                      ),
                    );
                  } else {
                    return const Text('0');
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Only view Without Data

class Global_Stream_Builder_For_Results_View_Only_Without_Result
    extends StatelessWidget {
  final String stream;
  final String substreamtext;
  final String streamtitletext;

  const Global_Stream_Builder_For_Results_View_Only_Without_Result(
      {super.key,
      required this.stream,
      required this.substreamtext,
      required this.streamtitletext});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(100.w, 0, 100.w, 0),
      padding: EdgeInsets.fromLTRB(20.w, 10.h, 10.w, 10.h),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        ),
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(50.sp),
      ),
      child: Row(
        children: [
          Text(
            streamtitletext,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 50.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          SizedBox(
            width: 40.w,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              height: 120.h,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
                color: Colors.grey[350],
                borderRadius: BorderRadius.circular(40.sp),
              ),
              // child: StreamBuilder<double>(
              //   stream: stream,
              //   builder:
              //       (BuildContext context, AsyncSnapshot<double> snapshot) {
              //     if (snapshot.hasData) {
              //       return GradientText(
              //         '${snapshot.data}' ' $substreamtext',
              //         maxLines: 1,
              //         overflow: TextOverflow.ellipsis,
              //         textAlign: TextAlign.center,
              //         style: TextStyle(
              //           fontSize: 70.sp,
              //           fontWeight: FontWeight.bold,
              //         ),
              //         colors: const [
              //           Colors.black,
              //           Colors.teal,
              //           Colors.red,
              //         ],
              //       );
              //     } else {
              //       return const Text('0');
              //     }
              //   },
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
