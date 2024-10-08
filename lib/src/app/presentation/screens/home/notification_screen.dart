import 'package:eshop/app_colors.dart';
import 'package:flutter/material.dart';

class NotificationModel {
  final String title;
  final String description;
  final String time;
  final IconData icon;
  final Color iconBgColor;
  bool isRead;

  NotificationModel({
    required this.title,
    required this.description,
    required this.time,
    required this.icon,
    required this.iconBgColor,
    this.isRead = false,
  });
}

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final List<NotificationModel> notifications = [
    NotificationModel(
      title: 'Invite friend',
      description: 'Deposite investmen',
      time: 'Today, 10:10 AM',
      icon: Icons.card_giftcard,
      iconBgColor: AppColors.greenColor,
    ),
    NotificationModel(
      title: 'Invite friend',
      description: 'Deposite investmen',
      time: 'Today, 10:10 AM',
      icon: Icons.shopping_bag,
      iconBgColor: AppColors.greenColor,
    ),
    NotificationModel(
      title: 'Invite friend',
      description: 'Deposite investmen',
      time: 'Today, 10:10 AM',
      icon: Icons.card_giftcard,
      iconBgColor: AppColors.greenColor,
    ),
    NotificationModel(
      title: 'Invite friend',
      description: 'Deposite investmen',
      time: 'Today, 10:10 AM',
      icon: Icons.shopping_bag,
      iconBgColor: AppColors.greenColor,
    ),
  ];

  void markAsRead(int index) {
    setState(() {
      notifications[index].isRead = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.gray03),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: AppColors.gray01,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key('notification_${index}'),
            direction: DismissDirection.horizontal,
            confirmDismiss: (direction) async {
              markAsRead(index);
              return false;
            },
            background: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              child: const Icon(
                Icons.check_circle,
                color: AppColors.greenColor,
                size: 30,
              ),
            ),
            secondaryBackground: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerRight,
              child: const Icon(
                Icons.check_circle,
                color: AppColors.greenColor,
                size: 30,
              ),
            ),
            child: NotificationItem(
              notification: notifications[index],
              onRead: () => markAsRead(index),
            ),
          );
        },
      ),
    );
  }
}

class NotificationItem extends StatefulWidget {
  final NotificationModel notification;
  final VoidCallback onRead;

  const NotificationItem({
    Key? key,
    required this.notification,
    required this.onRead,
  }) : super(key: key);

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(
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
      widget.onRead();
    });
  }

  void _handleTapCancel() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) => Transform.scale(
          scale: _scaleAnimation.value,
          child: child,
        ),
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: widget.notification.isRead ? Colors.white : Colors.green.shade50,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: widget.notification.iconBgColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        widget.notification.icon,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.notification.title,
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Poppins',
                              fontWeight: widget.notification.isRead ? FontWeight.w500 : FontWeight.w600,
                              color: AppColors.gray01,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.notification.description,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              color: widget.notification.isRead ? AppColors.gray04 : AppColors.gray01,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                widget.notification.time,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.gray02,
                                ),
                              ),
                              if (!widget.notification.isRead)
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Text(
                                    'Swipe to read',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.greenColor,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (!widget.notification.isRead)
                Positioned(
                  top: 16,
                  right: 16,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: AppColors.greenColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}