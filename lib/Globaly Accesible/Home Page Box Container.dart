import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home_Page_Box_Container extends StatelessWidget {
  String imageAsset;
  String buttonText;
  VoidCallback onPressed;

  Home_Page_Box_Container({
    required this.imageAsset,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 5.sp,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(40.sp),
        boxShadow: [
          BoxShadow(
            blurRadius: 50.sp,
            color: Colors.grey.withOpacity(0.9),
          ),
        ],
      ),
      height: 500.h,
      width: 400.w,
      child: Container(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            // borderRadius: BorderRadius.circular(10),
            onTap: onPressed,
            child: Ink(
              decoration: BoxDecoration(
                  // color: Colors.blue,
                  // borderRadius: BorderRadius.circular(10),
                  ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(imageAsset),
                    height: 250.h,
                  ),
                  Tooltip(
                    message: buttonText,
                    child: Text(
                      buttonText,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 50.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
