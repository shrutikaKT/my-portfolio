import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/screens/portfolio/bloc/portfolio_bloc.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../utils/functions.dart';
import '../../widgets/section_heading/section_heading.dart';

class Portfolio extends StatefulWidget {
  const Portfolio({super.key});

  @override
  State<Portfolio> createState() => _PortfolioState();
}

class _PortfolioState extends State<Portfolio> with TickerProviderStateMixin {
  late List<AnimationController> _singleProjectAnimationController;

  @override
  void initState() {
    _singleProjectAnimationController = List.generate(
        Constants().projects.length,
        (index) => AnimationController(
              vsync: this,
              duration: Duration(seconds: 1),
            ));
    super.initState();
  }

  @override
  void dispose() {
    // Dispose of each animation controller
    for (var controller in _singleProjectAnimationController) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PortfolioBloc(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              SectionHeadingWidget(
                title: 'Some things I\'ve Build',
                num: 03,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(bottom: 40.w),
                  itemCount: Constants().projects.length,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: EdgeInsets.only(bottom: 200.w),
                        padding: EdgeInsets.symmetric(vertical: 50.w),
                        child: SizedBox(
                          width: constraints.maxWidth,
                          child: constraints.maxWidth > 600
                              ? Stack(
                                  textDirection: !isOdd(index)
                                      ? TextDirection.rtl
                                      : TextDirection.ltr,
                                  clipBehavior: Clip.none,
                                  children: [
                                      !isOdd(index)
                                          ? Positioned(
                                              left: 0,
                                              child: MouseRegion(
                                                  onEnter: (pointer) {
                                                context
                                                    .read<PortfolioBloc>()
                                                    .add(MouseOverImageEvent());
                                              }, onHover: (pointer) {
                                                context
                                                    .read<PortfolioBloc>()
                                                    .add(MouseOverImageEvent());
                                              }, // Trigger on mouse enter
                                                  onExit: (pointer) {
                                                context
                                                    .read<PortfolioBloc>()
                                                    .add(MouseOutImageEvent());
                                              }, // Trigger on mouse exit
                                                  child: BlocBuilder<
                                                      PortfolioBloc,
                                                      PortfolioState>(
                                                builder: (context, state) {
                                                  return AnimatedScale(
                                                    scale: state
                                                            is ImageOverExitState
                                                        ? 1
                                                        : 1.1,
                                                    duration: 200.milliseconds,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.r),
                                                      child: Image.asset(
                                                        Constants()
                                                                .projects[index]
                                                            ['image'],
                                                        height: constraints
                                                                .maxWidth /
                                                            2.5,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              )),
                                            )
                                          : Positioned(
                                              right: 0,
                                              child: MouseRegion(
                                                  onEnter: (pointer) {
                                                context
                                                    .read<PortfolioBloc>()
                                                    .add(MouseOverImageEvent());
                                              }, onHover: (pointer) {
                                                context
                                                    .read<PortfolioBloc>()
                                                    .add(MouseOverImageEvent());
                                              }, // Trigger on mouse enter
                                                  onExit: (pointer) {
                                                context
                                                    .read<PortfolioBloc>()
                                                    .add(MouseOutImageEvent());
                                              }, // Trigger on mouse exit
                                                  child: BlocBuilder<
                                                          PortfolioBloc,
                                                          PortfolioState>(
                                                      builder:
                                                          (context, state) {
                                                return AnimatedScale(
                                                  scale: state
                                                          is ImageOverExitState
                                                      ? 1
                                                      : 1.1,
                                                  duration: 200.milliseconds,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.r),
                                                    child: Image.asset(
                                                      Constants()
                                                              .projects[index]
                                                          ['image'],
                                                      height:
                                                          constraints.maxWidth /
                                                              2.5,
                                                    ),
                                                  ),
                                                );
                                              }))),
                                      VisibilityDetector(
                                          key: ValueKey(
                                              'portfolio-section-{$index}-project'),
                                          onVisibilityChanged:
                                              (visibilityInfo) {
                                            double visiblePercentage =
                                                visibilityInfo.visibleFraction;
                                            // Restart animation when at least 20% of the section is visible
                                            if (visiblePercentage > 0 &&
                                                visibilityInfo.key ==
                                                    ValueKey(
                                                        'portfolio-section-{$index}-project') &&
                                                _singleProjectAnimationController[
                                                        index]
                                                    .isCompleted) {
                                              _singleProjectAnimationController[
                                                      index]
                                                  .reset();
                                              _singleProjectAnimationController[
                                                      index]
                                                  .forward();
                                            }
                                          },
                                          child: Animate(
                                              delay: 100.microseconds,
                                              controller:
                                                  _singleProjectAnimationController[
                                                      index],
                                              effects: [
                                                FadeEffect(
                                                    duration: 500.milliseconds,
                                                    curve: Curves.elasticIn,
                                                    begin: 0.7,
                                                    end: 1)
                                              ],
                                              child:
                                                  ProjectDetails(index: index)))
                                    ])
                              : Column(
                                  crossAxisAlignment: !isOdd(index)
                                      ? CrossAxisAlignment.start
                                      : CrossAxisAlignment.end,
                                  spacing: 20.h,
                                  children: [
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        child: Image.asset(
                                          Constants().projects[index]['image'],
                                          height: constraints.maxWidth * 0.7,
                                          width: constraints.maxWidth,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(
                                          width: constraints.maxWidth,
                                          child: ProjectDetails(index: index))
                                    ]),
                        ));
                  }),
            ],
          );
        },
      ),
    );
  }
}

class ProjectDetails extends StatelessWidget {
  final int index;
  const ProjectDetails({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        crossAxisAlignment:
            !!isOdd(index) ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        mainAxisAlignment:
            !!isOdd(index) ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          Text(
            Constants().projectKey,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Theme.of(context).primaryColor),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            Constants().projects[index]['name'],
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.h,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: constraints.maxWidth > 600
                    ? constraints.maxWidth * 0.8
                    : constraints.maxWidth),
            child: Container(
                width:
                    constraints.maxWidth > 600 ? 600.w : constraints.maxWidth,
                margin: EdgeInsets.symmetric(vertical: 5.h),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                decoration: BoxDecoration(
                    color: Color(0xFF5F9EA0),
                    borderRadius: BorderRadius.circular(10.r)),
                child: Text(
                  Constants().projects[index]['description'],
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.w100),
                )),
          ),
          Wrap(
              children: (Constants().projects[index]['tech'] as List<String>)
                  .map((item) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Text(
                "•$item",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            );
          }).toList()),
          SizedBox(
            height: 10.h,
          ),
          Visibility(
            visible: !Constants().projects[index]['link'].isEmpty,
            child: InkWell(
                onTap: () {
                  launchURL(Constants().projects[index]['link']);
                },
                child: Icon(Icons.attachment)),
          )
        ],
      );
    });
  }
}
