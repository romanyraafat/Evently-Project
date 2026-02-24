import 'package:evently_project/core/utils/app_colors.dart';
import 'package:evently_project/features/home/profile_tap/profile_tap.dart';
import 'package:evently_project/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: AppColors.primary,
      //   title: Text(AppLocalizations.of(context)!.hello),
      // ),
      body: ProfileTap(),
    );
  }
}