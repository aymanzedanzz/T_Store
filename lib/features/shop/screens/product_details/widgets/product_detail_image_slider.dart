import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curves_edges_widget.dart';
import '../../../../../common/widgets/icons/t_circular_icon.dart';
import '../../../../../common/widgets/images/t_rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TCurveEdgeWidget(
      child: Container(
        color: dark ? TColors.darkGrey : TColors.light,
        child: Stack(
          children: [
            /// AppBar Icon
            TAppBar(
              showBackArrow: true,
              actions: [TCircularIcon(icon: Iconsax.heart5, color: Colors.red)],
            ),
            SizedBox(height: TSizes.spaceBtwSections),

            /// Main Large Image
            SizedBox(
              height: 350,
              child: Padding(
                padding: EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(
                  child: Image(image: AssetImage(TImages.productImage5)),
                ),
              ),
            ),

            /// Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 70,
                child: ListView.separated(
                  itemCount: 6,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder:
                      (_, __) => SizedBox(width: TSizes.spaceBtwItems),
                  itemBuilder:
                      (_, index) => TRoundedImage(
                        width: 80,
                        backgroundColor:
                            dark ? TColors.darkGrey : TColors.light,
                        // border: Border.all(color: TColors.primary),
                        border: Border.all(color: TColors.grey),
                        padding: EdgeInsets.all(TSizes.sm),
                        imageUrl: TImages.productImage5,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
