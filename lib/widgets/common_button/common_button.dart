import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  const CommonButton(
      {super.key, required this.title, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        onPressed: () {},
        style: FilledButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
            ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ));
  }
}
