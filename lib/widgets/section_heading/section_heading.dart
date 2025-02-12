import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/main.dart';

class SectionHeadingWidget extends StatelessWidget {
  final String title;
  final int num;
  const SectionHeadingWidget({super.key, required this.title, required this.num});

  @override
  Widget build(BuildContext context) {
    return Row(
        spacing: 20.w,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "0$num.",
            style: TextStyle(color: primaryColor, fontWeight: FontWeight.w100, fontSize: 22.spMax),
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.spMax),
          ),
          Expanded(
            child: Divider(
              height: 10.h,
              thickness: 0.5.r,
              color: Colors.grey,
              endIndent: 100.w,
            ),
          )
        ]);
  }
}
