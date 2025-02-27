import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart' as animate;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/main.dart';
import 'package:portfolio/screens/experiance/bloc/experiance_bloc.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../widgets/section_heading/section_heading.dart';

class MyExperiance extends StatelessWidget {
  const MyExperiance({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    PageController pageController =
        PageController(initialPage: 0); // Page controller for the PageView

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SectionHeadingWidget(
        title: 'Where I\'ve worked',
        num: 02,
      ),
      SizedBox(
        height: 80.h,
      ),
      Padding(
        padding: EdgeInsets.only(left: 60.w),
        child: Text(
          "Responsibilities",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Theme.of(context).primaryColor),
        ),
      ),
      SizedBox(
        height: 10.h,
      ),
      SizedBox(
        height: 400.h,
        child: BlocBuilder<ExperianceBloc, ExperianceState>(
          builder: (context, state) {
            int currentPageIndex = 0;

            if (state is PageUpdatedState) {
              currentPageIndex = state.currentPageIndex;
            }

            // PageView.builder with the dynamic PageController
            return PageView.builder(
                itemCount: Constants().experiances.length,
                allowImplicitScrolling: true,
                physics: BouncingScrollPhysics(),
                pageSnapping: true,
                controller: pageController,
                onPageChanged: (index) {
                  context.read<ExperianceBloc>().add(ChangePageIndex(index));
                },
                itemBuilder: (context, index) {
                  return animate.Animate(
                    onPlay: (controller) {
                      // Restart animation if the page index has changed
                      if (pageController.page!.toInt() != currentPageIndex) {
                        controller.repeat();
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 60.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width > 800 ? width / 2.4 : width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Constants().experiances[currentPageIndex]
                                      ['overview']!,
                                  // textAlign: TextAlign.justify,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                Text(
                                  Constants().experiances[currentPageIndex]
                                      ['company']!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: Theme.of(context).primaryColor,
                                          fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  Constants().experiances[currentPageIndex]
                                      ['designation']!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color:
                                              Theme.of(context).primaryColor),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  Constants().experiances[currentPageIndex]
                                      ['year']!,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                )
                              ],
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  )
                      .animate()
                      .visibility()
                      .slideX(duration: 200.milliseconds, begin: 1, end: 0);
                });
          },
        ),
      ),
      Center(
        child: BlocBuilder<ExperianceBloc, ExperianceState>(
          builder: (context, state) {
            // SmoothPageIndicator
            return animate.Animate(
              onPlay: (controller) => controller.repeat(),
              child: SmoothPageIndicator(
                onDotClicked: (index) {
                  // Update the PageController position when a dot is clicked
                  pageController.animateToPage(
                    index,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                  context
                      .read<ExperianceBloc>()
                      .add(ChangePageIndex(index)); // Update the Bloc state
                },
                controller: pageController,
                count: Constants().experiances.length,
                effect: ScaleEffect(
                  scale: 2,
                  spacing: 12.0,
                  radius: 8.0,
                  dotWidth: 5.0,
                  dotHeight: 5.0,
                  dotColor: initialTheme == AdaptiveThemeMode.dark
                      ? Colors.white70
                      : Colors.blueGrey,
                  activeDotColor: Theme.of(context).primaryColor,
                ),
              ).animate().scale(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  ),
            );
          },
        ),
      ),
    ]);
  }
}
