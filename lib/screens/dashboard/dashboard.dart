import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/main.dart';
import 'package:portfolio/screens/dashboard/bloc/dashboard_bloc.dart';
import 'package:portfolio/screens/header/header.dart';
import 'package:portfolio/widgets/left_bottom_section/left_bottom_section.dart';
import 'package:portfolio/widgets/right_bottom_section/right_bottom_section.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../widgets/social_icons_list.dart';
import '../about_me/aboutme.dart';
import '../experiance/experiance.dart';
import '../footer/footer.dart';
import '../header/bloc/header_bloc.dart';
import '../portfolio/portfolio.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  late AnimationController _aboutmeAnimationController;
  late AnimationController _experianceAnimationController;
  late AnimationController _portfolioAnimationController;

  @override
  void initState() {
    _aboutmeAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _experianceAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _portfolioAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    super.initState();
  }

  @override
  void dispose() {
    _aboutmeAnimationController.dispose();
    _experianceAnimationController.dispose();
    _portfolioAnimationController.dispose();
    super.dispose();
  }

  void _startaboutmeAnimation() {
    _aboutmeAnimationController.reset();
    _aboutmeAnimationController.forward();
  }

  void _startExperianceAnimation() {
    _experianceAnimationController.reset();
    _experianceAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => DashboardBloc(),
      child: LayoutBuilder(builder: (context, constraints) {
        return Row(children: [
          Visibility(
            visible: constraints.maxWidth > 1440,
            child: Expanded(
              flex: 1,
              child: Container(
                color: Color(0XFF0C192D),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: LayoutBuilder(builder: (context, constraints) {
              return Scaffold(
                appBar: const PreferredSize(
                    preferredSize: Size.fromHeight(120), child: HeaderWidget()),
                body: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.w),
                      child: SingleChildScrollView(
                        controller:
                            context.read<DashboardBloc>().scrollController,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: width > 600 ? 200.w : 50.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BlocBuilder<HeaderBloc, HeaderState>(
                                  builder: (context, state) {
                                if (state is MenuOpened) {
                                  return Center(child: DrawerList());
                                } else {
                                  return Container();
                                }
                              }),
                              SizedBox(
                                height: width > 800 ? 200.h : 60.h,
                              ),
                              Column(
                                  key: helloKey,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Hi, my name is',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              color: Theme.of(context)
                                                  .primaryColor),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    AnimatedTextKit(
                                        repeatForever: true,
                                        animatedTexts: [
                                          TypewriterAnimatedText(
                                            'Shrutika Tatkare',
                                            speed: Duration(milliseconds: 200),
                                            textStyle: Theme.of(context)
                                                .textTheme
                                                .displayLarge!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                          )
                                        ]),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                          maxWidth: width > 800
                                              ? constraints.maxWidth / 2
                                              : constraints.maxWidth),
                                      child: Text(
                                        'With over 7 years of experience in mobile app development, I specialize in building high-quality applications, particularly using Flutter. I have a strong background in both technical execution and leadership, effectively managing teams and ensuring timely project delivery.',
                                        textAlign: TextAlign.justify,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 50.h,
                                    ),
                                    MouseRegion(
                                      child: OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                              padding: EdgeInsets.all(25)),
                                          onPressed: () {},
                                          child: Text('Let\'s Connect')),
                                    )
                                  ]),
                              SizedBox(
                                height: 200.h,
                              ),
                              // About Me Section with Visibility Detector
                              VisibilityDetector(
                                key: Key('about-me-section'),
                                onVisibilityChanged: (visibilityInfo) {
                                  // Restart the animation when it becomes visible
                                  if (visibilityInfo.visibleFraction == 0) {
                                    _startaboutmeAnimation();
                                    // Trigger animation restart here
                                    // For example, you can manually control the animation state.
                                  }
                                },
                                child:
                                    BlocListener<DashboardBloc, DashboardState>(
                                  listener: (context, state) {
                                    if (state is AboutMeVisibleState) {
                                      _startaboutmeAnimation();
                                    }
                                    if (state is ExperianceVisibleState) {
                                      _startExperianceAnimation();
                                    }
                                  },
                                  child: Column(key: aboutmeKey, children: [
                                    if (constraints.maxWidth > 960) ...{
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          spacing: 40.w,
                                          children: [
                                            Expanded(flex: 2, child: AboutMe()),
                                            FittedBox(child: MyPhoto())
                                          ]),
                                    } else ...{
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          spacing: 10.w,
                                          children: [
                                            AboutMe(),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 40.h),
                                              child: MyPhoto(),
                                            )
                                          ]),
                                    },
                                  ]),
                                )
                                        .animate(
                                            controller:
                                                _aboutmeAnimationController)
                                        .visibility(
                                            delay: 500.milliseconds,
                                            maintain: true,
                                            end: true)
                                        .fade(
                                            begin: 0,
                                            end: 1,
                                            duration: 2.seconds)
                                        .slide(
                                          begin: Offset(0, 0.2),
                                          end: Offset(0, 0),
                                          duration: 1.seconds,
                                        ),
                              ),
                              SizedBox(
                                height: 200.h,
                              ),
                              VisibilityDetector(
                                  key: Key('experiance-section'),
                                  onVisibilityChanged: (visibilityInfo) {
                                    // Restart the animation when it becomes visible
                                    if (visibilityInfo.visibleFraction == 0) {
                                      _startExperianceAnimation();
                                      // Trigger animation restart here
                                      // For example, you can manually control the animation state.
                                    }
                                  },
                                  child: MyExperiance(
                                    key: experianceKey,
                                  )
                                      .animate(
                                          controller:
                                              _experianceAnimationController)
                                      .visibility(
                                          delay: 300.milliseconds,
                                          maintain: true,
                                          end: true)
                                      .slide(
                                          duration: 1000.milliseconds,
                                          begin: Offset(0.5, 0.5),
                                          end: Offset(0, 0))
                                      .fadeIn()),
                              SizedBox(
                                height: 220.h,
                              ),
                              Portfolio(
                                key: portfolioKey,
                              ),
                              SizedBox(
                                height: 50.h,
                              ),
                              Divider(),
                              SizedBox(
                                height: 40.h,
                              ),
                              Footer(
                                key: contactKey,
                              ),
                              SizedBox(
                                height: 200.h,
                              ),
                              Visibility(
                                  visible: width < 800,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SocialIconsList(),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Center(
                                            child: Text(
                                          'shrutika.tatkare@apptware.com',
                                        )),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                      ])),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                        visible: width > 800,
                        child: Positioned(
                            left: 0, bottom: 0, child: LeftBottomSection())),
                    Visibility(
                        visible: width > 800,
                        child: Positioned(
                            right: 0, bottom: 0, child: RightBottomSection())),
                  ],
                ),
              );
            }),
          ),
          Visibility(
              visible: constraints.maxWidth > 1440,
              child: Expanded(
                flex: 1,
                child: Container(
                  color: Color(0XFF0C192D),
                ),
              )),
        ]);
      }),
    );
  }
}
