import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// For Colors

Color Universal_Gray = Color.fromRGBO(164, 164, 164, 1.0);

// Title Text , Input Field , Subtitle FOR SINGAL GINNING

Widget buildRowWidget(String title, TextEditingController controller,
    String subtitle, double FixedHeight, double FixedWidth) {
  return Container(
    margin: EdgeInsets.fromLTRB(0, 0.007.sh, 0, 0),
    child: Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // SizedBox(width: 0.01.sh),
        Container(
          width: 0.15.sh,
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 0.018.sh,
            ),
          ),
        ),
        // SizedBox(
        //   width: FixedWidth * 0.12,
        // ),
        SizedBox(width: 0.03.sh),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(FixedHeight * 0.01, 0, 0, 0),
          height: 0.049.sh,
          width: 0.17.sh,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 1.1,
            ),
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: TextField(
            textAlign: TextAlign.left,
            controller: controller,
            style: TextStyle(fontSize: 0.025.sh, color: Colors.black),
            decoration: InputDecoration(
              border: InputBorder.none,

              // hintText: 'Kapas',
              // contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ),

        SizedBox(width: 0.01.sh),

        //Sub title Text
        Container(
          alignment: Alignment.centerLeft,
          // height: FixedHeight * 0.045,
          // width: FixedWidth * 0.24,
          child: Text(
            subtitle,
            style: TextStyle(fontSize: 0.012.sh, color: Colors.black),
          ),
        ),
      ],
    ),
  );
}

// Title Text , Input Field , Subtitle FOR COMPARE GINNING
Widget buildRowComapreWidget(String title, TextEditingController controller,
    String subtitle, double FixedHeight, double FixedWidth) {
  return Container(
    margin: EdgeInsets.fromLTRB(0, 0.007.sh, 0, 0),
    child: Row(
      children: [
        Container(
          width: 0.15.sh,
          // alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 0.018.sh,
            ),
          ),
        ),
        // SizedBox(width: FixedWidth * 0.25),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(FixedHeight * 0.01, 0, 0, 0),
          height: 0.045.sh,
          width: 0.28.sw,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 1.1,
            ),
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: TextField(
            textAlign: TextAlign.left,
            controller: controller,
            style: TextStyle(fontSize: 0.025.sh, color: Colors.black),
            decoration: InputDecoration(
              border: InputBorder.none,

              // hintText: 'Kapas',
              // contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ),
      ],
    ),
  );
}

// BoxDecoration Six_Container_Decoration() {
//   return BoxDecoration(
//     border: Border.all(
//       color: Colors.black,
//       width: 1.0,
//     ),
//     color: Colors.white,
//     borderRadius: BorderRadius.circular(10),
//     boxShadow: [
//       BoxShadow(
//         // offset: const Offset(4, 5),
//         blurRadius: 20,
//         color: Colors.black.withOpacity(0.5),
//       ),
//     ],
//   );
// }
//
// TextStyle App_Bar_Text_Style(FixedHeight) {
//   return TextStyle(
//     color: Colors.black,
//     fontSize: FixedHeight * 0.035,
//     fontWeight: FontWeight.bold,
//   );
// }
