import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Globle_Access_Variables.dart';
import 'Screen Size Varibles.dart';

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
  Size get preferredSize => Size.fromHeight(Global_Appbar_Height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        AppbarText,
        style: TextStyle(
          fontSize: 0.025.sh,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      backgroundColor: Universal_Gray,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(0.05.sh),
        ),
      ),
      flexibleSpace: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0.05.sw, 0, 0.05.sw, 0.01.sh),
            height: 0.05.sh,
            width: 1.sw,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.grey[300],
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      0.005.sw,
                      0.005.sh,
                      0.005.sw,
                      0.005.sh,
                    ),
                    child: TextButton(
                      onPressed: () => onButtonPressed(true),
                      style: TextButton.styleFrom(
                        backgroundColor: isFirstButtonSelected
                            ? const Color.fromRGBO(35, 35, 35, 1)
                            : Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Text(
                        SliderText1,
                        style: TextStyle(
                          color: isFirstButtonSelected
                              ? Colors.white
                              : Colors.grey[800],
                          fontSize: 0.015.sh,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      0.003.sw,
                      0.003.sh,
                      0.003.sw,
                      0.003.sh,
                    ),
                    child: TextButton(
                      onPressed: () => onButtonPressed(false),
                      style: TextButton.styleFrom(
                        backgroundColor: isFirstButtonSelected
                            ? Colors.transparent
                            : const Color.fromRGBO(35, 35, 35, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Text(
                        SliderText2,
                        style: TextStyle(
                          color: isFirstButtonSelected
                              ? Colors.grey[800]
                              : Colors.white,
                          fontSize: 0.015.sh,
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
