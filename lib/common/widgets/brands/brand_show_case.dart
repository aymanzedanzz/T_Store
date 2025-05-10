import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/brands/t_brand_card.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../products/rounded_container.dart';

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.all(TSizes.md),
      margin: EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children: [
          /// Brand with Products Count
          TBrandCard(showBorder: true),
          SizedBox(height: TSizes.spaceBtwItems),

          /// Brand Top 3 Product Images
          Row(
            children:
                images
                    .map((image) => brandTopProductImageWidget(image, context))
                    .toList(),
          ),
        ],
      ),
    );
  }
}

Widget brandTopProductImageWidget(String image, context) {
  return Expanded(
    child: TRoundedContainer(
      height: 100,
      backgroundColor:
          THelperFunctions.isDarkMode(context)
              ? TColors.darkGrey
              : TColors.light,
      margin: EdgeInsets.only(right: TSizes.sm),
      padding: EdgeInsets.all(TSizes.md),
      child: Image(fit: BoxFit.contain, image: AssetImage(image)),
    ),
  );
}
