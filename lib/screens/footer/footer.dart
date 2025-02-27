import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/utils/functions.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '04. What\'s Next?',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              !.copyWith(color: Theme.of(context).primaryColor),
        ),
        SizedBox(height: 10.h),
        Text(
          'Get In Touch',
          style: Theme.of(context)
              .textTheme
              .titleLarge
              !.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.h),
        Text(
          'Although I\'m not currently looking for new opportunities, my inbox is always open. Whether you have a question or just want to say hi, I\'ll try my best to get you as soon as possible.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(height: 20.h),
        OutlinedButton(onPressed: () {
          launchURL("https://wa.me/917057110312");
        }, child: Text('Say Hello'))
      ],
    );
  }
}
