import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RightBottomSection extends StatelessWidget {
  const RightBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 25.h),
          child: RotatedBox(
              quarterTurns: 5,
              child: SizedBox(
                  height: 100.h,
                  child: Center(
                      child: Text(
                    'tatkare99shruti@gmail.com',
                  )))),
        ),
        SizedBox(
            height: 150.h,
            child: VerticalDivider(
              thickness: 0.5,
            ))
      ],
    );
  }
}
