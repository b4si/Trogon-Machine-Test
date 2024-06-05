import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:trogon_machine_test/view/analysis_screen.dart';
import 'package:trogon_machine_test/view/course_screen.dart';
import 'package:trogon_machine_test/view/home_screen.dart';
import 'package:trogon_machine_test/view/profile_screen.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({super.key});

  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBarWidget> {
  int _selectedIndex = 0;
  late PageController _pageController;

  final List<String> iconList = [
    'assets/majesticons_home-line.png',
    'assets/Subtract.png',
    'assets/Reading.png',
    'assets/iconamoon_profile-fill.png',
  ];

  final labelList = <String>[
    'Home',
    'Courses',
    'Analysis',
    'Profile',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    });
  }

  Widget _buildIconWithLabel(String iconPath, String label, bool isSelected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          iconPath,
          color: isSelected ? Colors.grey.shade700 : Colors.grey.shade400,
          height: 24,
          width: 24,
        ),
        Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.grey.shade700 : Colors.grey.shade400,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [
          HomeScreen(),
          CourseScreen(),
          AnalysisScreen(),
          ProfileScreen()
        ],
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      floatingActionButton: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                offset: const Offset(0.5, 0.5),
                blurRadius: 6,
                spreadRadius: 0.5,
              ),
            ],
            color: const Color(0xFF512E7E),
            borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Image.asset(
            'assets/rewards_icon.png',
            height: 10,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          return _buildIconWithLabel(
              iconList[index], labelList[index], isActive);
        },
        height: 65,
        shadow: BoxShadow(
          color: Colors.grey.shade400,
          offset: const Offset(-1, -1),
          blurRadius: 6,
          spreadRadius: 0.5,
        ),
        activeIndex: _selectedIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (index) {
          _onItemTapped(index);
        },
        backgroundColor: Colors.white,
        // inactiveColor: Colors.grey.shade600,
        // activeColor: Colors.black,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
