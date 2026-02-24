import 'package:evently_project/core/utils/app_colors.dart';
import 'package:evently_project/core/utils/assets_images/my_images.dart';
import 'package:evently_project/core/utils/router/route_names.dart';
import 'package:evently_project/features/onboarding/models/onboarding_model.dart';
import 'package:evently_project/providers/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _controller = PageController();

  bool isLastPage = false;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Image.asset(MyImages.assetsImagesAppLogo),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              /// Pages
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: OnboardingModel.onboardingList.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex = index;
                      isLastPage =
                          index == OnboardingModel.onboardingList.length - 1;
                    });
                  },
                  itemBuilder: (context, index) {
                    final item = OnboardingModel.onboardingList[index];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: Image.asset(item.image)),
                        const SizedBox(height: 20),
                        Text(
                          item.title,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 15),
                        Text(
                          item.description,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    );
                  },
                ),
              ),
                SizedBox(height: 35,),
              /// Dots
              SmoothPageIndicator(
                controller: _controller,
                count: OnboardingModel.onboardingList.length,
                effect: ExpandingDotsEffect(
                  dotColor:
                      context.watch<AppThemeProvider>().appTheme ==
                          ThemeMode.light
                      ? AppColors.black
                      : AppColors.lightGray,
                  activeDotColor: AppColors.blue,
                  dotHeight: 8,
                  dotWidth: 8,
                ),
              ),

              const SizedBox(height: 30),

              /// Navigation Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Back Button (Animated)
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: currentIndex > 0 ? 1 : 0,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: currentIndex > 0 ? 50 : 0,
                      height: 50,
                      child: currentIndex > 0
                          ? GestureDetector(
                              onTap: () {
                                _controller.previousPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: AppColors.blue, // لون الحلقة
                                    width: 3, // سماكة الحلقة
                                  ),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: AppColors.blue,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ),
                  ),

                  /// Next / Finish Button
                  GestureDetector(
                    onTap: () {
                      if (isLastPage) {
                        Navigator.pushReplacementNamed(
                          context,
                          RouteNames.homeView,
                        );
                      } else {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 3,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.blue, // لون الحلقة
                            width: 3, // سماكة الحلقة
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_forward,
                            color: AppColors.blue,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
