import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class InviteFriendsScreen extends StatelessWidget {
  const InviteFriendsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.gray03),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Invite Friends',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: AppColors.gray01,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Illustration
              Image.asset(
                'assets/images/together.png',
                height: 200,
              ),
              const SizedBox(height: 24),
              // Description Text
              const Text(
                'Please share the code below for\nyour friends to join with us.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  color: AppColors.gray03,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              // Invite Code Container
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8F9FB),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'HK32334434',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        color: AppColors.gray01,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Clipboard.setData(const ClipboardData(text: 'HK32334434'));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Code copied to clipboard')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.greenColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                      child: const Text(
                        'Copy',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              const Divider(),
              const SizedBox(height: 16),
              // Social Media Options
              _buildSocialOption(
                icon: FontAwesomeIcons.facebook,
                title: 'Facebook',
                color: const Color(0xFF1877F2),
                onTap: () {},
              ),
              _buildSocialOption(
                icon: FontAwesomeIcons.xTwitter,
                title: 'X',
                color: Colors.black,
                onTap: () {},
              ),
              _buildSocialOption(
                icon: FontAwesomeIcons.instagram,
                title: 'Instagram',
                color: const Color(0xFFE4405F),
                onTap: () {},
              ),
              _buildSocialOption(
                icon: Icons.contacts_outlined,
                title: 'Contacts',
                color: const Color(0xFF8E44AD),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialOption({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      splashColor: Colors.transparent,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: 'Poppins',
          color: AppColors.gray01,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: AppColors.gray03,
      ),
      onTap: onTap,
    );
  }
}