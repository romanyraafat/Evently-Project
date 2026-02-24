import 'package:evently_project/core/utils/assets_images/my_images.dart';
import 'package:flutter/material.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image.asset(MyImages.assetsImagesFindEvent)),
          Text(
            "Find Events That Inspire You",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: 39),
          Text(
            "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(height: 39),
        ],
      ),
    );
  }
}
