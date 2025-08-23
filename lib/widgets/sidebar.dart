import 'package:flutter/material.dart';
import 'package:myvillage/constants/colors.dart';
import '../models/user_model.dart';

class Sidebar extends StatelessWidget {
  final User user;
  final VoidCallback onClose;

  const Sidebar({super.key, required this.user, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(2, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header with close button
          Container(
            height: 140,
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
            ),
            child: Stack(
              children: [
                // User info
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.white.withOpacity(0.2),
                        child: const Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        user.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                // Close button
                Positioned(
                  top: 16,
                  right: 16,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.white, size: 28),
                    onPressed: onClose,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildMenuItem(Icons.person, 'Profile', onClose),
                _buildMenuItem(Icons.email, 'Email', onClose, subtitle: user.email),
                _buildMenuItem(Icons.phone, 'Phone', onClose, subtitle: user.phone),
                _buildMenuItem(Icons.location_on, 'Address', onClose, subtitle: user.address),
                const Divider(height: 30, thickness: 1),
                _buildMenuItem(Icons.settings, 'Settings', onClose),
                _buildMenuItem(Icons.help, 'Help & Support', onClose),
                _buildMenuItem(Icons.logout, 'Logout', onClose, color: AppColors.red),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap, {String? subtitle, Color? color}) {
    return ListTile(
      leading: Icon(icon, color: color ?? AppColors.primary),
      title: Text(title, style: TextStyle(color: color ?? AppColors.textPrimary)),
      subtitle: subtitle != null ? Text(subtitle, style: const TextStyle(fontSize: 12)) : null,
      onTap: onTap,
    );
  }
}