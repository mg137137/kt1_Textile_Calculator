import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Figma_Design/Home_Page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Home_Page()),
          );
        }
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // final double fixedHeight = constraints.maxHeight;
        // final double fixedWidth = constraints.maxWidth;

        return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Opacity(
                  opacity: _animation.value,
                  child: Container(
                    alignment: Alignment.center,
                    height: 0.22.sh,
                    width: 0.22.sh,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Image.asset('assets/logo-no-background.png'),
                  ),
                ),
                SizedBox(
                  height: 0.20.sh,
                  width: 0.20.sh,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.r,
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Colors.black38),
                    backgroundColor: Colors.grey[300],
                    value: _animation.value,
                  ),
                ),
                // Align(
                //   alignment: Alignment.bottomCenter,
                //   child: SizedBox(
                //     width: 1.sw,
                //     height: 0.16.sh,
                //     child: Column(
                //       children: [
                //         Text(
                //           'Designed By ',
                //           style: TextStyle(
                //             fontSize: 0.02.sh,
                //             height: 0.004.sh,
                //             fontWeight: FontWeight.bold,
                //             color: Colors.black,
                //           ),
                //         ),
                //         // SizedBox(height: 0.01.sh),
                //         Image.asset(
                //           'assets/kingtext.png',
                //           height: 0.05.sh,
                //           width: 0.5.sw,
                //           // width: 0.08.sh,
                //         ),
                //       ],
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        );
      },
    );
  }
}
