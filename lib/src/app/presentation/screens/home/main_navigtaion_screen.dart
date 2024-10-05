import 'package:eshop/src/app/presentation/screens/home/cart.dart';
import 'package:eshop/src/app/presentation/screens/home/home_screen.dart';
import 'package:eshop/src/app/presentation/screens/home/notification_screen.dart';
import 'package:eshop/src/app/presentation/screens/home/reveiws_screen.dart';
import 'package:flutter/material.dart';

import '../../../../../app_colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const CartScreen(),
    NotificationsScreen(),
    ReviewsScreen(),
  ];

  // for smooth transitions
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        physics: const NeverScrollableScrollPhysics(),
        children: _screens,
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: Container(
          height: screenHeight * 0.10,
          decoration: BoxDecoration(
            color: Colors.white,
              boxShadow: [
          BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 0.5,
          blurRadius: 5,
          offset: const Offset(0, 2),
        )],
          ),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                buildIcon(Icons.grid_view, 0),
                buildIcon(Icons.shopping_bag, 1),
                buildIcon(Icons.notifications, 2),
                buildIcon(Icons.person, 3),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildIcon(IconData icon, int index) {
    bool isSelected = _selectedIndex == index;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => _onItemTapped(index),
            splashColor: AppColors.greenColor.withOpacity(0.3),
            highlightColor: Colors.transparent,
            borderRadius: BorderRadius.circular(18),
            child: Ink(
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.greenColor.withOpacity(0.1)
                    : Colors.transparent,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12
                ),
                child: Icon(
                  icon,
                  color: isSelected ? AppColors.greenColor : Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text('Profile Screen'),
      ),
    );
  }
}