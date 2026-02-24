import 'package:evently_project/core/utils/app_colors.dart';
import 'package:evently_project/core/utils/assets_images/my_images.dart';
import 'package:evently_project/core/utils/styles.dart';
import 'package:evently_project/features/home/profile_tap/app_language_bottom_sheet.dart';
import 'package:evently_project/features/home/profile_tap/app_theme_bottom_sheet.dart';
import 'package:evently_project/l10n/app_localizations.dart';
import 'package:evently_project/providers/app_language_provider.dart';
import 'package:evently_project/providers/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileTap extends StatelessWidget {
  const ProfileTap({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(90),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primary,
        toolbarHeight: h * .2,
        title: Padding(
          padding: const EdgeInsets.only(left:8.0+8),
          child: Row(
            children: [
              Image.asset(MyImages.assetsImagesRouteImage),
              SizedBox(width: w * .02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "John Safwat",
                    style: Styles.styleBold24.copyWith(
                      color: AppColors.lightGray,
                    ),
                  ),
                  Text(
                    "johnsafwat.route@gmail.com",
                    style: Styles.styleMedium16.copyWith(
                      color: AppColors.lightGray,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8 + 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: h * .02),
            InkWell(
              onTap: () {
                showLanguageButtonSheet(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8 + 8),
                  border: BoxBorder.all(color: AppColors.blue, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8 + 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.language_type,
                        style: Styles.styleBold20.copyWith(
                          color: AppColors.blue,
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        size: 50,
                        color: AppColors.blue,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: h * .03),
            Text(
              AppLocalizations.of(context)!.theme,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            SizedBox(height: h * .02),
            InkWell(
              onTap: () {
                showAppTheme(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8 + 8),
                  border: BoxBorder.all(color: AppColors.blue, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8 + 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context.watch<AppThemeProvider>().appTheme ==
                                ThemeMode.light
                            ? AppLocalizations.of(context)!.lightTheme
                            : AppLocalizations.of(context)!.darkTheme,
    
                        style: Styles.styleBold20.copyWith(
                          color: AppColors.blue,
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        size: 50,
                        color: AppColors.blue,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(8 + 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(8 + 8),
                ),
                alignment:
                    context.watch<AppLanguageProvider>().appLanguage == 'en'
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                backgroundColor: AppColors.red,
                minimumSize: Size(double.infinity, h * .07),
              ),
              onPressed: () {},
              child: Row(
                children: [
                  Icon(Icons.logout, color: AppColors.lightGray, size: 25),
                  SizedBox(width: h * .02),
                  Text(
                    AppLocalizations.of(context)!.logout,
                    style: Styles.styleRegulvre20.copyWith(
                      color: AppColors.lightGray,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showLanguageButtonSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return AppLanguageBottomSheet();
      },
    );
  }

  void showAppTheme(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return AppThemeBottomSheet();
      },
    );
  }
}
