import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../backend/services/api_service.dart';
import 'package:t_store/backend/utils/auth_storage.dart';
import 'package:t_store/navigation_menu.dart';
import '../../password_configuration/forget_password.dart';
import '../../signup/signup.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class TLoginForm extends StatefulWidget {
  const TLoginForm({super.key});

  @override
  _TLoginFormState createState() => _TLoginFormState();
}

class _TLoginFormState extends State<TLoginForm> {
  final ApiService apiService = ApiService();

  // محررات النصوص للبريد وكلمة المرور
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  Future<void> _login() async {
    String email = emailController.text;
    String password = passwordController.text;

    // التحقق من صحة البيانات
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("يرجى إدخال البريد الإلكتروني وكلمة المرور")),
      );
      return;
    }

    // طلب تسجيل الدخول
    String? token = await apiService.loginUser(email, password);
    if (token != null) {
      await AuthStorage().saveToken(token); // تخزين التوكن بعد تسجيل الدخول
      Get.offAll(() => const NavigationMenu()); // الانتقال إلى الصفحة الرئيسية
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("خطأ في تسجيل الدخول")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            /// Email
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),

            /// Password
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: TTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            /// Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: rememberMe,
                      onChanged: (value) => setState(() => rememberMe = value!),
                    ),
                    const Text(TTexts.rememberMe),
                  ],
                ),
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()),
                  child: const Text(TTexts.forgetPassword),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Sign in Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _login,
                child: const Text(TTexts.signIn),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: const Text(TTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:t_store/features/authentication/screens/password_configuration/forget_password.dart';
// import 'package:t_store/features/authentication/screens/signup/signup.dart';
// import 'package:t_store/navigation_menu.dart';
// import 'package:iconsax/iconsax.dart';
// import '../../../../../utils/constants/sizes.dart';
// import '../../../../../utils/constants/text_strings.dart';
// import 'package:get/get.dart';
//
//
// class TLoginForm extends StatelessWidget {
//   const TLoginForm({
//     super.key,
//   });
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(
//           vertical: TSizes.spaceBtwSections,
//         ),
//         child: Column(
//           children: [
//             /// Email
//             TextFormField(
//               decoration: const InputDecoration(
//                 prefixIcon: Icon(Iconsax.direct_right),
//                 labelText: TTexts.email,
//               ),
//             ),
//             const SizedBox(height: TSizes.spaceBtwInputFields),
//
//             /// Password
//             TextFormField(
//               decoration: const InputDecoration(
//                 prefixIcon: Icon(Iconsax.password_check),
//                 labelText: TTexts.password,
//                 suffixIcon: Icon(Iconsax.eye_slash),
//               ),
//             ),
//             const SizedBox(height: TSizes.spaceBtwInputFields / 2),
//
//             /// Remember Me & Forget Password
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 /// Remember Me
//                 Row(
//                   children: [
//                     Checkbox(value: true, onChanged: (value) {}),
//                     const Text(TTexts.rememberMe),
//                   ],
//                 ),
//
//                 /// Forget Password
//                 TextButton(
//                   onPressed: () => Get.to(() => const ForgetPassword()),
//                   child: const Text(TTexts.forgetPassword),
//                 ),
//               ],
//             ),
//             const SizedBox(height: TSizes.spaceBtwSections),
//
//             /// Sign in Button
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () => Get.to(() => const NavigationMenu()),
//                 child: const Text(TTexts.signIn),
//               ),
//             ),
//
//             const SizedBox(height: TSizes.spaceBtwItems),
//
//             /// Create Account Button
//             SizedBox(
//               width: double.infinity,
//               child: OutlinedButton(
//                 onPressed: () => Get.to(() => const SignupScreen()),
//                 child: const Text(TTexts.createAccount),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
