import 'package:flutter/material.dart';
import 'package:kt1_textile_calculator/Menuitem_Pages/Homepage_Bottom_navigationbar.dart';
import 'package:kt1_textile_calculator/Menuitem_Pages/Profilepage_Bottom_navigationbar.dart';
import 'package:kt1_textile_calculator/Menuitem_Pages/Settingpage_Bottom_navigationbar.dart';

class Dashboard_Main_Page extends StatefulWidget {
  const Dashboard_Main_Page({super.key});

  @override
  _Dashboard_Main_PageState createState() => _Dashboard_Main_PageState();
}

class _Dashboard_Main_PageState extends State<Dashboard_Main_Page> {
  final PageController _pageController = PageController();
  int _selectedPage = 0;

  final List<Widget> _pages = [
    const Homepage_Bottom_navigationbar(),
    const Settingpage_Bottom_navigationbar(),
    const Profilepage_Bottom_navigationbar(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (int page) {
          setState(() {
            _selectedPage = page;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPage,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
            _pageController.animateToPage(
              _selectedPage,
              duration: const Duration(milliseconds: 5),
              curve: Curves.easeInOut,
            );
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// class FirstPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.red,
//       child: Center(
//         child: Text('First Page'),
//       ),
//     );
//   }
// }

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: const Center(
        child: Text('Second Page'),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: const Center(
        child: Text('Third Page'),
      ),
    );
  }
}
