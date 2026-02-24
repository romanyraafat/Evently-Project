import 'package:evently_project/core/utils/app_colors.dart';
import 'package:evently_project/core/utils/assets_images/my_images.dart';
import 'package:evently_project/core/utils/router/route_names.dart';
import 'package:evently_project/core/utils/styles.dart';
import 'package:evently_project/providers/app_language_provider.dart';
import 'package:evently_project/providers/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class PersonalizeView extends StatelessWidget {
  const PersonalizeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Padding(
          padding: const EdgeInsets.only(top: 8 + 8),
          child: Image.asset(MyImages.assetsImagesAppLogo),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20 ,vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            SizedBox(height: 20),
            Expanded(child: Image.asset(MyImages.assetsImagesPersonalise)),
            SizedBox(height: 20),
            Text(
              "Personalize Your Experience",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 20),
            Text(
              "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Language",
                  style: Styles.styleMedium20.copyWith(color: AppColors.blue),
                ),
                LanguageToggle(),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Theme",
                  style: Styles.styleMedium20.copyWith(color: AppColors.blue),
                ),
                ThemeToggle(),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(8+8)
                ),
                padding: EdgeInsets.symmetric(vertical: 20),
                minimumSize: Size(double.infinity, 20),
                backgroundColor: AppColors.blue
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, RouteNames.onBoarding);
              },
              child: Text(
                "Let’s Start",
                style: Styles.styleMedium20.copyWith(color:AppColors.lightGray ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageToggle extends StatelessWidget {
  const LanguageToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final currentLang = context.watch<AppLanguageProvider>().appLanguage;

    int initialIndex = currentLang == 'en' ? 0 : 1;

    return ToggleSwitch(
      minWidth: 55,
      minHeight: 45,
      initialLabelIndex: initialIndex,
      cornerRadius: 30,
      activeBgColor: const [Colors.blue],
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.blue.shade100,
      inactiveFgColor: Colors.blue,
      totalSwitches: 2,
      labels: const ['🇺🇸', '🇪🇬'],
      onToggle: (index) {
        if (index == 0) {
          context.read<AppLanguageProvider>().changeAppLanguage('en');
        } else {
          context.read<AppLanguageProvider>().changeAppLanguage('ar');
        }
      },
    );
  }
}

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<AppThemeProvider>().appTheme;

    int initialIndex = themeMode == ThemeMode.light ? 0 : 1;

    return ToggleSwitch(
      minWidth: 55,
      minHeight: 45,
      initialLabelIndex: initialIndex,
      cornerRadius: 30,
      activeBgColor: const [Colors.blue],
      activeFgColor: Colors.white,
      inactiveBgColor: Colors.blue.shade100,
      inactiveFgColor: Colors.blue,
      totalSwitches: 2,
      icons: const [Icons.light_mode, Icons.dark_mode],
      onToggle: (index) {
        if (index == 0) {
          context.read<AppThemeProvider>().changeThemeMode(ThemeMode.light);
        } else {
          context.read<AppThemeProvider>().changeThemeMode(ThemeMode.dark);
        }
      },
    );
  }
}
