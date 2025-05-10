import 'package:flutter/material.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import 'package:t_store/utils/constants/sizes.dart';
import '../../../utils/constants/colors.dart';

class TCircularIcon extends StatelessWidget {
  const TCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = TSizes.lg,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color:
            backgroundColor != null
                ? backgroundColor!
                : THelperFunctions.isDarkMode(context)
                ? TColors.black.withAlpha((0.5 * 255).toInt())
                : TColors.white.withAlpha((0.5 * 255).toInt()),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: color, size: size),
      ),
    );
  }
}
