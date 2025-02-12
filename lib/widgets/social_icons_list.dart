import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/utils/constants.dart';

class SocialIconsList extends StatelessWidget {
  const SocialIconsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
 mainAxisAlignment: MainAxisAlignment.center,
 crossAxisAlignment: CrossAxisAlignment.center,
      children: Constants().socialIcons.map((iconDetails) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 10.h),
          child: Center(
              child: FaIcon(
            iconDetails['icon'],
          )),
        );
      }).toList(),
    );
  }
}
