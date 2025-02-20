import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/constants.dart';
import '../../utils/functions.dart';

class LeftBottomSection extends StatelessWidget {
  const LeftBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: Constants().socialIcons.length,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    launchURL(Constants().socialIcons[index]['link']);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    child: Center(
                        child: FaIcon(
                      Constants().socialIcons[index]['icon'],
                    )),
                  ),
                );
              }),
          SizedBox(
              height: 150.h,
              child: VerticalDivider(
                thickness: 0.5,
              ))
        ],
      ),
    );
  }
}
