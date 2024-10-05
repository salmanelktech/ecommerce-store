import 'package:eshop/app_colors.dart';
import 'package:flutter/material.dart';

class NotificationModel {
  final String title;
  final String description;
  final String time;
  final IconData icon;
  final Color iconBgColor;

  NotificationModel({
    required this.title,
    required this.description,
    required this.time,
    required this.icon,
    required this.iconBgColor,
  });
}

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({Key? key}) : super(key: key);

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
      icon: Icons.info,
      iconBgColor: AppColors.greenColor,
    ),
    NotificationModel(
      title: 'Invite friend',
      description: 'Deposite investmen',
      time: 'Today, 10:10 AM',
      icon: Icons.check_circle,
      iconBgColor: AppColors.greenColor,
    ),
    NotificationModel(
      title: 'Invite friend',
      description: 'Deposite investmen',
      time: 'Today, 10:10 AM',
      icon: Icons.info,
      iconBgColor: AppColors.greenColor,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.gray03),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Notifications',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            color: AppColors.gray01,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return NotificationItem(notification: notifications[index]);
        },
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final NotificationModel notification;

  const NotificationItem({
    Key? key,
    required this.notification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: notification.iconBgColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                notification.icon,
                color: Colors.white,
                size: 24,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      color: AppColors.gray01,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    notification.description,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: AppColors.gray04,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  Text(
                    notification.time,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: AppColors.gray02,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}