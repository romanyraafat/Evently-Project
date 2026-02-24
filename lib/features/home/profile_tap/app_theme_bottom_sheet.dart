import 'package:evently_project/core/utils/app_colors.dart';
import 'package:evently_project/core/utils/styles.dart';
import 'package:evently_project/l10n/app_localizations.dart';
import 'package:evently_project/providers/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppThemeBottomSheet extends StatefulWidget {
  const AppThemeBottomSheet({super.key});

  @override
  State<AppThemeBottomSheet> createState() => _AppThemeBottomSheetState();
}

class _AppThemeBottomSheetState extends State<AppThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var appLanguageProvider = Provider.of<AppThemeProvider>(context);
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(h * .03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              //todo change app appTheme to english.
              context.read<AppThemeProvider>().changeThemeMode(ThemeMode.dark);
            },
            child: appLanguageProvider.appTheme == ThemeMode.dark
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.darkTheme,
                        style: Styles.styleBold20.copyWith(
                          color: AppColors.blue,
                        ),
                      ),
                      Icon(Icons.check, color: AppColors.blue, size: 35),
                    ],
                  )
                : unSelectedWidget(
                    appTheme: AppLocalizations.of(context)!.darkTheme,
                  ),
          ),
          SizedBox(height: h * .05),
          InkWell(
            onTap: () {
              //todo change app appTheme to arabic.
              context.read<AppThemeProvider>().changeThemeMode(ThemeMode.light);
            },
            child: appLanguageProvider.appTheme == ThemeMode.light
                ? selectedWidget(appTheme: AppLocalizations.of(context)!.lightTheme)
                : unSelectedWidget(
                    appTheme: AppLocalizations.of(context)!.lightTheme,
                  ),
          ),
        ],
      ),
    );
  }

  Widget selectedWidget({required String appTheme}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          // AppLocalizations.of(context)!.english,
          appTheme,
          style: Styles.styleBold20.copyWith(color: AppColors.blue),
        ),
        Icon(Icons.check, color: AppColors.blue, size: 35),
      ],
    );
  }

  Widget unSelectedWidget({required String appTheme}) {
    return Text(
      // AppLocalizations.of(context)!.arabic,
      appTheme,
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}
