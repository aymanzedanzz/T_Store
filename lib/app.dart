import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/theme/theme.dart';

// import 'features/authentication/screens/onboarding/onboarding.dart';
import 'features/authentication/screens/onboarding/widgets/check_onboarding_status.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: TCheckOnBoardingStatus(),
    );
  }
}
