import 'package:flutter/material.dart';
import '../theme_provider.dart';

class DashboardHeader extends StatelessWidget {
  final String userName;
  final String role;
  final String? vehicleInfo;
  final String? statusText;

  const DashboardHeader({
    super.key,
    required this.userName,
    required this.role,
    this.vehicleInfo,
    this.statusText,
  });

  @override
  Widget build(BuildContext context) {
    final dark = isDarkMode(context;);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors:dark
              ? [const Color(0xFF0D1B3E), const Color(0xFF0A1628)]
              : [const Color(0xFFE3EDFF), const Color(0xFFF0F6FF)],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: 
                  dark ? AppColors.darkSurface : Colors.blue[100],
                child: Icon(
                  _roleIcon(),
                 color: dark ? AppColors.brandYellow : AppColors.primaryBlue,
                 size: 28,
                ),
              ),
              const SizedBox(width:  14),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: []
                ))
            ],)
        ],
      ),
    )
  }
}
