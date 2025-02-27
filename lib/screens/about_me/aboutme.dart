import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/screens/about_me/bloc/about_bloc.dart';

import '../../utils/constants.dart';
import '../../widgets/section_heading/section_heading.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeadingWidget(
          title: 'About Me',
          num: 01,
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
            'Hi, my name is Shrutika Tatkare, and I have a deep passion for creating mobile apps. Even in my busy schedule, I find joy in exploring innovative ideas that enhance user experiences. My journey in mobile app development began in 2017 when I decided to dive into building engaging and impactful applications.\n\nFast-forward to today, I\'ve had the privilege of working at Apptware Solutions LLP, a startup where I focused on designing and developing powerful mobile applications. My goal is to craft apps that not only look great but also deliver seamless performance, ensuring an exceptional user experience.',
            textAlign: width > 800 ? TextAlign.justify : TextAlign.start,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w200, fontStyle: FontStyle.italic)),
        SizedBox(
          height: 20.h,
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: 'I build ', style: Theme.of(context).textTheme.bodyMedium),
          WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: AnimatedTextKit(repeatForever: true, animatedTexts: [
                TyperAnimatedText('awesome flutter apps',
                    textStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        !.copyWith(color: Theme.of(context).primaryColor)),
                TyperAnimatedText('progressive web apps',
                    textStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        !.copyWith(color: Theme.of(context).primaryColor)),
                TyperAnimatedText('awesome android apps',
                    textStyle: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        !.copyWith(color: Theme.of(context).primaryColor)),
              ])),
        ])),
        SizedBox(
          height: 20.h,
        ),
        Text('Here are a few technologies I\'ve been working with recently :',
            style: Theme.of(context).textTheme.bodyMedium),
        SizedBox(
          height: 20.h,
        ),
        Wrap(
          direction: Axis.vertical,
          spacing: 16.w, // Horizontal space between the skills
          runSpacing: 16.h, // Vertical space between the rows
          children: Constants().skills.map((skill) {
            return Row(
              children: [
                Icon(Icons.arrow_forward_ios,
                    size: 14.spMax, color: Theme.of(context).primaryColor),
                SizedBox(width: 8.w),
                Text(skill, style: Theme.of(context).textTheme.bodyMedium),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }
}

class MyPhoto extends StatelessWidget {
  const MyPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AboutBloc>(
        create: (context) => AboutBloc(),
        child: LayoutBuilder(builder: (context, constraint) {
          return BlocBuilder<AboutBloc, AboutState>(
            builder: (context, state) {
              return MouseRegion(
                  onEnter: (pointer) {
                    context.read<AboutBloc>().add(OnMouseOverIn());
                  },
                  onHover: (pointer) {
                    context.read<AboutBloc>().add(OnMouseOverIn());
                  }, // Trigger on mouse enter
                  onExit: (pointer) {
                    context.read<AboutBloc>().add(OnMouseOverOut());
                  }, // Trigger on mouse exit
                  child: Stack(clipBehavior: Clip.none, children: [
                    Positioned(
                      bottom: -20,
                      right: -20,
                      child: Container(
                        height: constraint.maxWidth > 1024 ? 300.h : 200.h,
                        width: constraint.maxWidth > 1024 ? 300.h : 200.h,
                        decoration: BoxDecoration(
                            border: Border.all(color: Theme.of(context).primaryColor),
                            borderRadius: BorderRadius.circular(10.r)),
                      ),
                    ),
                    AnimatedContainer(
                      margin: EdgeInsets.only(
                          bottom: state is OpacityAdded ? 10.h : 0),
                      duration: Duration(milliseconds: 300),
                      child: SizedBox(
                        height: constraint.maxWidth > 1024 ? 300.h : 200.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.asset(
                            'assets/images/me.jpg',
                            fit: BoxFit.cover,
                            color: state is OpacityAdded
                                ? null
                                // ignore: deprecated_member_use
                                : Theme.of(context).primaryColor.withOpacity(0.8),
                            colorBlendMode: BlendMode.hue,
                            filterQuality: FilterQuality.low,
                          ),
                        ),
                      ),
                    )
                  ]));
            },
          );
        }));
  }
}
