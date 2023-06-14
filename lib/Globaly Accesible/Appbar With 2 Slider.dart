import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Globle_Access_Variables.dart';

class Global_CustomAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String AppbarText;
  final String SliderText1;
  final String SliderText2;
  final bool isFirstButtonSelected;
  final Function(bool) onButtonPressed;

  const Global_CustomAppBar({
    required this.SliderText1,
    required this.SliderText2,
    required this.AppbarText,
    required this.isFirstButtonSelected,
    required this.onButtonPressed,
  });

  @override
  Size get preferredSize => Size.fromHeight(350.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        AppbarText,
        style: TextStyle(
          fontSize: 70.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      backgroundColor: Universal_Gray,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(150.sp),
        ),
      ),
      flexibleSpace: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(100.w, 0, 100.w, 30.h),
            height: 130.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.grey[300],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 5.h),
                    child: TextButton(
                      onPressed: () => onButtonPressed(true),
                      style: TextButton.styleFrom(
                        backgroundColor: isFirstButtonSelected
                            ? const Color.fromRGBO(35, 35, 35, 1)
                            : Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.sp),
                        ),
                      ),
                      child: Text(
                        SliderText1,
                        style: TextStyle(
                          color: isFirstButtonSelected
                              ? Colors.white
                              : Colors.grey[800],
                          fontSize: 50.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(5.w, 5.h, 5.w, 5.h),
                    child: TextButton(
                      onPressed: () => onButtonPressed(false),
                      style: TextButton.styleFrom(
                        backgroundColor: isFirstButtonSelected
                            ? Colors.transparent
                            : const Color.fromRGBO(35, 35, 35, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.sp),
                        ),
                      ),
                      child: Text(
                        SliderText2,
                        style: TextStyle(
                          color: isFirstButtonSelected
                              ? Colors.grey[800]
                              : Colors.white,
                          fontSize: 50.sp,
                        ),
                      ),
                    ),
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
