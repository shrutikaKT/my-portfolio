import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/main.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '04. What\'s Next?',
          style: TextStyle(color: primaryColor, fontSize: 12.spMax),
        ),
        SizedBox(height: 10.h),
        Text(
          'Get In Touch',
          style: TextStyle(fontSize: 28.spMax, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.h),
        Text(
          'Although I\'m not currently looking for new opportunities, my inbox is always open. Whether you have a question or just want to say hi, I\'ll try my best to get you as soon as possible.',
          style: TextStyle(fontSize: 14.spMax),
        ),
        SizedBox(height: 20.h),
        OutlinedButton(onPressed: () {}, child: Text('Say Hello'))
      ],
    );
  }
}
