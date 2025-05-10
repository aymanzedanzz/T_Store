import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../rounded_container.dart';

class TCouponCode extends StatelessWidget {
  const TCouponCode({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? TColors.dark : TColors.white,
      padding: EdgeInsets.only(
        top: TSizes.sm,
        bottom: TSizes.sm,
        right: TSizes.sm,
        left: TSizes.md,
      ),
      child: Row(
        children: [
          /// TextField
          Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter promo code',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          /// Button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor:
                    dark
                        ? TColors.white.withAlpha((0.5 * 255).toInt())
                        : TColors.dark.withAlpha((0.5 * 255).toInt()),
                backgroundColor: Colors.grey.withAlpha((0.2 * 255).toInt()),
                side: BorderSide(
                  color: Colors.grey.withAlpha((0.1 * 255).toInt()),
                ),
              ),
              child: Text('Apply'),
            ),
          ),
        ],
      ),
    );
  }
}
