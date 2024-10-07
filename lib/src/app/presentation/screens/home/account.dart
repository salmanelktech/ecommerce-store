import 'package:eshop/app_colors.dart';
import 'package:eshop/src/app/presentation/screens/auth/log_in.dart';
import 'package:eshop/src/app/presentation/screens/home/invite_friend.dart';
import 'package:eshop/src/app/presentation/screens/home/notification_screen.dart';
import 'package:eshop/src/app/presentation/screens/home/payment_success.dart';
import 'package:eshop/src/app/presentation/screens/home/reveiws_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'card_blank.dart';
import 'order_failed.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 50),

              // Profile Image
              const CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(
                  'https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg',
                ),
              ),
              const SizedBox(height: 16),

              //Name
              const Text(
                'Name',
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: AppColors.gray01,
                ),
              ),
              const SizedBox(height: 4),

              //Email
              const Text(
                'www.@example.com',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: AppColors.gray03,
                ),
              ),
              const SizedBox(height: 32),

              // Settings List
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    _buildMenuItem(
                      icon: Icons.credit_card_outlined,
                      title: 'Payment Methods',
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => PaymentSuccessScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                    _buildMenuItem(
                      icon: Icons.person_outline,
                      title: 'Account Information',
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => ReviewsScreen(),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 8),

                    const Divider(
                      height: 1,
                      color: AppColors.gray06,
                    ),

                    const SizedBox(height: 8),
                    _buildMenuItem(
                      icon: Icons.notifications_none_outlined,
                      title: 'Notifications',
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => NotificationsScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                    _buildMenuItem(
                      icon: Icons.group_outlined,
                      title: 'Invite Friends',
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const InviteFriendsScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                    _buildMenuItem(
                      icon: Icons.settings_outlined,
                      title: 'Settings',
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => OrderFailed(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 8),
                    _buildMenuItem(
                      icon: Icons.description_outlined,
                      title: 'Terms of services',
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => CardBlank(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    _buildLogoutItem(
                      icon: Icons.logout_outlined,
                      title: 'Log Out',
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const SignInScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  // Setting List Item View

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return MenuItem(
      icon: icon,
      title: title,
      onTap: onTap,
    );
  }

  Widget _buildLogoutItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return MenuItem(
      icon: icon,
      title: title,
      onTap: onTap,
      isLogout: true,
    );
  }
}


//ListItem Design with Click Animation effect
class MenuItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isLogout;

  const MenuItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.isLogout = false,
  }) : super(key: key);

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutQuart,
        reverseCurve: Curves.easeInQuart,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    Future.delayed(const Duration(milliseconds: 100), () {
      _controller.reverse();
    });


    Future.delayed(const Duration(milliseconds: 100), () {
      // Add code here for navigation
      widget.onTap();
    });
  }

  void _handleTapCancel() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) => Transform.scale(
        scale: _scaleAnimation.value,
        child: GestureDetector(
          onTapDown: _handleTapDown,
          onTapUp: _handleTapUp,
          onTapCancel: _handleTapCancel,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: widget.isLogout
                  ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 0.5,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ]
                  : null,
            ),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: widget.isLogout ? 10 : 4,
              ),
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.gray07,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  widget.icon,
                  color: widget.isLogout ? Colors.grey[600] : AppColors.gray03,
                  size: 22,
                ),
              ),
              title: Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  color: AppColors.gray01,
                ),
              ),
              trailing: Icon(
                Icons.chevron_right,
                color: widget.isLogout ? AppColors.gray03 : AppColors.gray05,
                size: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

