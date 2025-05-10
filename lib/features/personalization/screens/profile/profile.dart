import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';
import 'package:t_store/common/widgets/images/t_circular_image.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/image_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),

      /// Body
      body: SingleChildScrollView(
        child: Padding(
          // padding: EdgeInsets.all(TSizes.defaultSpace),
          padding: EdgeInsets.only(
            bottom: TSizes.defaultSpace,
            left: TSizes.defaultSpace,
            right: TSizes.defaultSpace,
          ),
          child: Column(
            children: [
              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    TCircularImage(image: TImages.user, width: 80, height: 80),
                    TextButton(
                      onPressed: () {},
                      child: Text('Change Profile Picture'),
                    ),
                  ],
                ),
              ),

              /// Details
              // SizedBox(height: TSizes.spaceBtwItems / 2),
              Divider(),
              SizedBox(height: TSizes.spaceBtwItems),

              /// Heading Profile Info
              TSectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(
                onPressed: () {},
                title: 'Name',
                value: 'Coding with me',
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'Username',
                value: 'coding_with_me',
              ),

              SizedBox(height: TSizes.spaceBtwItems),
              Divider(),
              SizedBox(height: TSizes.spaceBtwItems),

              /// Heading Personal Info
              TSectionHeading(
                title: 'Personal Information',
                showActionButton: false,
              ),
              SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(
                onPressed: () {},
                title: 'User ID',
                value: '45689',
                icon: Iconsax.copy,
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'E-mail',
                value: 'coding_with_t',
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'Phone Number',
                value: '+92-317-8059528',
              ),
              TProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male'),
              TProfileMenu(
                onPressed: () {},
                title: 'Date of Birth',
                value: '10 Oct, 1994',
              ),
              Divider(),
              SizedBox(height: TSizes.spaceBtwItems / 4),

              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
