import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../backend/services/api_service.dart';
import 'package:t_store/backend/utils/auth_storage.dart';
import 'package:t_store/features/authentication/screens/signup/verify_email.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class TSignupForm extends StatefulWidget {
  const TSignupForm({super.key});

  @override
  _TSignupFormState createState() => _TSignupFormState();
}

class _TSignupFormState extends State<TSignupForm> {
  final ApiService apiService = ApiService();

  // إعداد محررات النصوص لكل حقل إدخال
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool termsAccepted = false;

  Future<void> _register() async {
    String username = usernameController.text;
    String email = emailController.text;
    String phone = phoneController.text;
    String password = passwordController.text;

    // التحقق من صحة البيانات
    if (username.isEmpty ||
        email.isEmpty ||
        phone.isEmpty ||
        password.isEmpty ||
        !termsAccepted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("يرجى ملء جميع الحقول والموافقة على الشروط")),
      );
      return;
    }

    // طلب التسجيل
    String? token = await apiService.registerUser(
      username,
      email,
      phone,
      password,
    );
    if (token != null) {
      await AuthStorage().saveToken(token);
      Get.to(() => const VerifyEmailScreen()); // الانتقال بعد نجاح التسجيل
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("خطأ في إنشاء الحساب")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          /// Username
          TextFormField(
            controller: usernameController,
            decoration: const InputDecoration(
              labelText: TTexts.username,
              prefixIcon: Icon(Iconsax.user),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Email
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: TTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Phone Number
          TextFormField(
            controller: phoneController,
            decoration: const InputDecoration(
              labelText: TTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          /// Password
          TextFormField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: TTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),

          /// Terms & Conditions Checkbox
          Row(
            children: [
              Checkbox(
                value: termsAccepted,
                onChanged: (value) => setState(() => termsAccepted = value!),
              ),
              Text("أوافق على الشروط والأحكام"),
            ],
          ),

          const SizedBox(height: TSizes.spaceBtwSections),

          /// Sign Up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _register,
              child: const Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:t_store/features/authentication/screens/signup/verify_email.dart';
// import 'package:t_store/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:get/get.dart';
//
// import '../../../../../utils/constants/sizes.dart';
// import '../../../../../utils/constants/text_strings.dart';
//
// class TSignupForm extends StatelessWidget {
//   const TSignupForm({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 child: TextFormField(
//                   expands: false,
//                   decoration: const InputDecoration(
//                     labelText: TTexts.firstName,
//                     prefixIcon: Icon(Iconsax.user),
//                   ),
//                 ),
//               ),
//               const SizedBox(width: TSizes.spaceBtwInputFields),
//               Expanded(
//                 child: TextFormField(
//                   expands: false,
//                   decoration: const InputDecoration(
//                     labelText: TTexts.lastName,
//                     prefixIcon: Icon(Iconsax.user),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: TSizes.spaceBtwInputFields),
//
//           /// Username
//           TextFormField(
//             expands: false,
//             decoration: const InputDecoration(
//               labelText: TTexts.username,
//               prefixIcon: Icon(Iconsax.user_edit),
//             ),
//           ),
//
//           const SizedBox(height: TSizes.spaceBtwInputFields),
//
//           /// Email
//           TextFormField(
//             decoration: const InputDecoration(
//               labelText: TTexts.email,
//               prefixIcon: Icon(Iconsax.direct),
//             ),
//           ),
//
//           const SizedBox(height: TSizes.spaceBtwInputFields),
//
//           /// Phone Number
//           TextFormField(
//             decoration: const InputDecoration(
//               labelText: TTexts.phoneNo,
//               prefixIcon: Icon(Iconsax.call),
//             ),
//           ),
//
//           const SizedBox(height: TSizes.spaceBtwInputFields),
//
//           /// Password
//           TextFormField(
//             obscureText: true,
//             decoration: const InputDecoration(
//               labelText: TTexts.password,
//               prefixIcon: Icon(Iconsax.password_check),
//               suffixIcon: Icon(Iconsax.eye_slash),
//             ),
//           ),
//
//           /// Terms & Condition Checkbox
//           const SizedBox(height: TSizes.spaceBtwItems),
//           const TTermsAndConditionCheckbox(),
//
//           const SizedBox(height: TSizes.spaceBtwSections),
//
//           /// Sign Up Button
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               onPressed: () => Get.to(() => const VerifyEmailScreen()),
//               child: const Text(TTexts.createAccount),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
