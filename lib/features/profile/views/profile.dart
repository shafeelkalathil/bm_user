import 'package:bm_user/core/constants/asset_constants.dart';
import 'package:bm_user/features/profile/views/address_screen.dart';
import 'package:bm_user/features/profile/views/languages_screen.dart';
import 'package:bm_user/features/profile/views/my_account.dart';
import 'package:bm_user/features/profile/views/payment_&_refund_screen.dart';
import 'package:bm_user/features/shared/widgets/custom_app_bar.dart';
import 'package:bm_user/features/shared/widgets/shadow_container.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/color_constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: CustomAppBar(title: 'Profile',trailing: IconButton(
        icon: const Icon(Icons.info_outline, color: Colors.grey),
        onPressed: () {
          // Handle info action
        },
      ),),
      body: const ProfileBody(),
    );
  }

}

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProfileCard(),
          const SizedBox(height: 24),
          ..._buildMenuItems(context),
          const SizedBox(height: 24),
          const LogoutButton(),
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  List<Widget> _buildMenuItems(BuildContext context) {
    final menuItems = [
      ProfileMenuItem(
        title: 'MY ACCOUNT',
        onTap: () =>     Navigator.push(context, MaterialPageRoute(builder: (context) => MyAccountScreen(),)),
      ),
      ProfileMenuItem(
        title: 'ADDRESS',
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AddressScreen(),)),
      ),
      ProfileMenuItem(
        title: 'PAYMENTS & REFUND',
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentAndRefundScreen(),)),
      ),
      ProfileMenuItem(
        title: 'LANGUAGE',
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LanguagesScreen(),))
      ),
      ProfileMenuItem(
        title: 'ACTIVITY & HISTORY',
        onTap: () => _handleMenuTap(context, 'Activity & History'),

      ),
      ProfileMenuItem(
        title: 'NOTIFICATION & CHATS',
        onTap: () => _handleMenuTap(context, 'Notification & Chats'),
      ),
      ProfileMenuItem(
        title: 'REFER A FRIEND',
        onTap: () => _handleMenuTap(context, 'Refer a Friend'),
      ),
      ProfileMenuItem(
        title: 'SUPPORT',
        onTap: () => _handleMenuTap(context, 'Support'),
      ),
    ];

    return menuItems
        .map((item) => Padding(
      padding: const EdgeInsets.only(bottom: 1),
      child: item,
    ))
        .toList();
  }

  void _handleMenuTap(BuildContext context, String menuTitle) {
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E3A5F),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ProfileAvatar(),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProfileInfo(),
                const SizedBox(height: 12),
                const StarRating(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white, width: 2),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(6),
        child: Image.asset(
          AssetConstants.manUser,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[300],
              child: const Icon(
                Icons.person,
                size: 40,
                color: Colors.grey,
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        ProfileInfoRow(label: 'CUST ID', value: '................'),
        SizedBox(height: 4),
        ProfileInfoRow(label: 'Name', value: '................'),
        SizedBox(height: 4),
        ProfileInfoRow(label: '', value: '................'),
        SizedBox(height: 4),
        ProfileInfoRow(label: '', value: '................'),
      ],
    );
  }
}

class ProfileInfoRow extends StatelessWidget {
  final String label;
  final String value;

  const ProfileInfoRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (label.isNotEmpty) ...[
          SizedBox(
            width: 60,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}

class StarRating extends StatelessWidget {
  const StarRating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
            (index) => const Padding(
          padding: EdgeInsets.only(right: 2),
          child: Icon(
            Icons.star,
            color: Colors.amber,
            size: 16,
          ),
        ),
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const ProfileMenuItem({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: ShadowContainer(
          width: double.infinity,
          // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _showLogoutDialog(context),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric( vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.logout,
                size: 28,
                color: primary.shade500,
              ),
              SizedBox(width: 8),
              Text(
                'Log Out',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: primary.shade500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logout Icon
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.logout,
                    size: 32,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 24),

                // Title
                const Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),

                // Subtitle
                const Text(
                  'Are you sure you want to logout?',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),

                // Buttons
                Row(
                  children: [
                    // Logout Button
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          // Handle logout logic here
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Logged out successfully'),
                              backgroundColor: Colors.green,
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          foregroundColor: Colors.black54,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Cancel Button
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}