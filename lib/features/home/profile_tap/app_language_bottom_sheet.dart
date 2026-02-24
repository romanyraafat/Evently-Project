import 'package:evently_project/core/utils/app_colors.dart';
import 'package:evently_project/core/utils/styles.dart';
import 'package:evently_project/l10n/app_localizations.dart';
import 'package:evently_project/providers/app_language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppLanguageBottomSheet extends StatefulWidget {
  const AppLanguageBottomSheet({super.key});

  @override
  State<AppLanguageBottomSheet> createState() => _AppLanguageBottomSheetState();
}

class _AppLanguageBottomSheetState extends State<AppLanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var appLanguageProvider = Provider.of<AppLanguageProvider>(context);
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(h * .03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              //todo change app language to english.
              context.read<AppLanguageProvider>().changeAppLanguage('en');
            },
            child: appLanguageProvider.appLanguage == "en"
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.english,
                        style: Styles.styleBold20.copyWith(
                          color: AppColors.blue,
                        ),
                      ),
                      Icon(Icons.check, color: AppColors.blue, size: 35),
                    ],
                  )
                : unSelectedWidget(
                    language: AppLocalizations.of(context)!.english,
                  ),
          ),
          SizedBox(height: h * .05),
          InkWell(
            onTap: () {
              //todo change app language to arabic.
              context.read<AppLanguageProvider>().changeAppLanguage('ar');
            },
            child: appLanguageProvider.appLanguage == "ar"
                ? selectedWidget(language: AppLocalizations.of(context)!.arabic)
                : Text(
                    AppLocalizations.of(context)!.arabic,
                    style: Styles.styleBold20.copyWith(color: AppColors.black),
                  ),
          ),
        ],
      ),
    );
  }

  Widget selectedWidget({required String language}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          // AppLocalizations.of(context)!.english,
          language,
          style: Styles.styleBold20.copyWith(color: AppColors.blue),
        ),
        Icon(Icons.check, color: AppColors.blue, size: 35),
      ],
    );
  }

  Widget unSelectedWidget({required String language}) {
    return Text(
      // AppLocalizations.of(context)!.arabic,
      language,
      style: Styles.styleBold20.copyWith(color: AppColors.black),
    );
  }
}
