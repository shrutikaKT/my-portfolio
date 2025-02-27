import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionHeadingWidget extends StatelessWidget {
  final String title;
  final int num;
  const SectionHeadingWidget(
      {super.key, required this.title, required this.num});

  @override
  Widget build(BuildContext context) {
    return Row(
        spacing: 20.w,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "0$num.",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w100),
          ),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Divider(
              height: 10.h,
              thickness: 0.5.r,
              endIndent: 100.w,
            ),
          )
        ]);
  }
}
