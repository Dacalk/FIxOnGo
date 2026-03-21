import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme_provider.dart';

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;

  const OtpInput({
    super.key,
    required this.controller,
    this.autoFocus = false,
  });

  @override
  Widget build(BuildContext context) {
    final dark = isDarkMode(context);

    return Container(
      width: 60,
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: dark ? AppColors.darkInputBackground : AppColors.lightInputBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: dark ? AppColors.darkBorder : AppColors.lightBorder,
          width: 1.5,
        ),
      ),
      child: TextField(
        controller: controller,
        autofocus: autoFocus,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: dark ? AppColors.darkText : AppColors.lightText,
        ),
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        maxLength: 1,
        decoration: const InputDecoration(
          counterText: '',
          border: InputBorder.none,
        ),
      ),
    );
  }
}