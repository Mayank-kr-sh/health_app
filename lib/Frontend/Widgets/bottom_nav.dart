import 'package:flutter/material.dart';

import '../Constant/Constant.dart';
// import '../Screens/Doctor.dart';
import '../Screens/HomeScreen.dart';
import '../Screens/contact/contact_screen.dart';
import '../Screens/Product/product_screen.dart';
import '../Screens/Profile.dart';

const Color kInactiveIconColor = Colors.grey;

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: const [
          HomeScreen(),
          ProductScreen(),
          AboutScreen(),
          ContactScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
                color: 0 == _currentIndex ? kPrimaryColor : kInactiveIconColor),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits,
                color: 1 == _currentIndex ? kPrimaryColor : kInactiveIconColor),
            label: 'Product',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,
                color: 2 == _currentIndex ? kPrimaryColor : kInactiveIconColor),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat,
                color: 3 == _currentIndex ? kPrimaryColor : kInactiveIconColor),
            label: 'Contact',
          ),
        ],
        selectedItemColor: kPrimaryColor,
      ),
    );
  }
}
