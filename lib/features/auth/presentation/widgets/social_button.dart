import 'package:flutter/material.dart';
import '../../../../utils/constants/colors/colors.dart';

class SocialButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? color;
  final Color? textColor;

  const SocialButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.color,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    // Default colors are now handled by AppColors logic or passed in
    // However, for Social Buttons which often have specific brand colors,
    // we can keep the flexible override but default to neutral if needed.
    
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    final buttonColor = color ?? (isDark ? AppColors.darkerGrey : AppColors.lightContainer);
    final contentColor = textColor ?? (isDark ? AppColors.white : AppColors.black);
    final borderColor = isDark ? AppColors.darkGrey : AppColors.borderPrimary;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: borderColor,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Icon(icon, color: contentColor),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: contentColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
