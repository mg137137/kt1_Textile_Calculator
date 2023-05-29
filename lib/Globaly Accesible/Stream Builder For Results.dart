import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Global_Stream_Builder_For_Results extends StatelessWidget {
  final Stream<int> stream;
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
      width: 0.9.sh,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        ),
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Text(
            streamtitletext,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(
            width: 0.02.sh,
          ),
          Expanded(
            child: Container(
              height: 0.05.sh,
              width: 0.06.sw,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
                color: Colors.grey[350],
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: StreamBuilder<int>(
                stream: stream,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  if (snapshot.hasData) {
                    return GradientText(
                      '${snapshot.data}' ' $substreamtext',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        // fontSize: ,
                        fontWeight: FontWeight.bold,
                      ),
                      colors: const [
                        Colors.black,
                        Colors.teal,
                        Colors.red,
                      ],
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
