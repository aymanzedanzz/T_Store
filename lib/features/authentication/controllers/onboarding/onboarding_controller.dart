import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../screens/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Variables
  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// Update Current Index when Page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  /// Jump to the specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    // pageController.jumpTo(index);
    pageController.jumpToPage(index);
  }

  /// Update Current Index & jump to next page
  void nextPage() {
    if(currentPageIndex.value == 2) {
      completeOnBoarding();
    } else {
      pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  /// Update Current & jump to last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }


  Future<void> completeOnBoarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onBoardingCompleted', true); // حفظ أن الـ OnBoarding تم
    Get.offAll(() => const LoginScreen()); // الانتقال إلى شاشة تسجيل الدخول
  }

}
