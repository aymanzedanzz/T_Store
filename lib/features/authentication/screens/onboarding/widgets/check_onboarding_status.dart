import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../login/login.dart';
import '../onboarding.dart';

class TCheckOnBoardingStatus extends StatelessWidget {
  const TCheckOnBoardingStatus({super.key});

  // دالة للتحقق من حالة الـ OnBoarding في SharedPreferences
  Future<bool> _checkOnBoardingStatus() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onBoardingCompleted') ??
        false; // إرجاع القيمة المخزنة أو false إذا لم تكن موجودة
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _checkOnBoardingStatus(),
      builder: (context, snapshot) {
        // التحقق من حالة الـ OnBoarding
        if (snapshot.hasData) {
          if (snapshot.data == true) {
            return const LoginScreen(); // إذا كان الـ OnBoarding مكتمل
          } else {
            return const OnBoardingScreen(); // إذا كان الـ OnBoarding غير مكتمل
          }
        } else {
          // في حال كان الـ snapshot لا يحتوي على بيانات (قد يكون شيء خاطئ)
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
