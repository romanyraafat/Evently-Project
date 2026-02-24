import 'package:evently_project/core/utils/app_colors.dart';
import 'package:evently_project/core/utils/styles.dart';
import 'package:evently_project/features/home/profile_tap/app_language_bottom_sheet.dart';
import 'package:evently_project/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ProfileTap extends StatelessWidget {
  const ProfileTap({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primary,
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
            SizedBox(height: h * .01),
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
}
