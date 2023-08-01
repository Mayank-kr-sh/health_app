import 'package:flutter/material.dart';

import '../Constant/Constant.dart';
// import '../Screens/Doctor.dart';
import '../Screens/HomeScreen.dart';
import '../Screens/contact/contact_screen.dart';
import '../Screens/Product/product_screen.dart';
import '../Screens/profile/Profile.dart';

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
          ProfileScreen(),
          ContactScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
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
                color:
                    0 == _currentIndex ? kSecondaryColor : kInactiveIconColor),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services,
                color:
                    1 == _currentIndex ? kSecondaryColor : kInactiveIconColor),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,
                color:
                    2 == _currentIndex ? kSecondaryColor : kInactiveIconColor),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail,
                color:
                    3 == _currentIndex ? kSecondaryColor : kInactiveIconColor),
            label: 'Contact',
          ),
        ],
        selectedItemColor: kSecondaryColor,
      ),
    );
  }
}
