import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helper_functions.dart';


class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    this.textColor,
    this.showActionButton = true,
    required this.title,
    this.buttonTitle = 'View all',
    this.onPressed,
  });

  final Color? textColor;
  final bool showActionButton;

  // final bool showButtonTitle;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall!.apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(
            onPressed: onPressed,
            child: Text(buttonTitle, style: TextStyle(
                color: dark ? TColors.light : TColors.dark,
            ),
            ),
          ),
      ],
    );
  }
}
