import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/brands/t_brand_card.dart';
import 'package:t_store/common/widgets/layouts/grid_layout.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/shop/screens/brand/brand_products.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:get/get.dart';


class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// Heading
            TSectionHeading(title: 'Brands', showActionButton: false),
            SizedBox(height: TSizes.spaceBtwItems),

            /// Brands
            TGridLayout(
              itemCount: 10,
              mainAxisExtend: 80,
              itemBuilder:
                  (context, index) => TBrandCard(
                    showBorder: true,
                    onTap: () => Get.to(() => BrandProducts()),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
