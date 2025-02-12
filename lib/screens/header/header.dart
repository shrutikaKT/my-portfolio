import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/main.dart';
import 'package:portfolio/screens/dashboard/bloc/dashboard_bloc.dart';
import 'package:portfolio/screens/header/bloc/header_bloc.dart';
import 'package:portfolio/utils/constants.dart';

import '../../widgets/common_button/common_button.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
          key: headerKey,
          body: LayoutBuilder(builder: (context, constraints) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(children: [
                Row(
                  spacing: 20.w,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 100.h,
                    ),
                    CommonButton(
                      title: 'CV',
                    ),
                    Spacer(),
                    if (constraints.maxWidth > 800) ...{
                      WebheaderWidget()
                    } else ...{
                      MobileHeaderWidget()
                    }
                  ],
                ),
              ]),
            );
          }));
    });
  }
}

class WebheaderWidget extends StatelessWidget {
  const WebheaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: Constants()
          .headerList
          .map(
            (item) => InkWell(
              onTap: () {
                switch (item) {
                  case 'Hello':
                    context
                        .read<DashboardBloc>()
                        .add(ScrollToWidgetEvent(helloKey));
                    break;
                  case 'About':
                    context
                        .read<DashboardBloc>()
                        .add(ScrollToWidgetEvent(aboutmeKey));
                    break;
                  case 'Experiance':
                    context
                        .read<DashboardBloc>()
                        .add(ScrollToWidgetEvent(experianceKey));
                    break;
                  case 'Portfolio':
                    context
                        .read<DashboardBloc>()
                        .add(ScrollToWidgetEvent(portfolioKey));
                    break;
                  default:
                }
              },
              child: Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                  child: Text(
                    item,
                    style: TextStyle(fontSize: 14.spMax),
                  )),
            ),
          )
          .toList(),
    );
  }
}

class MobileHeaderWidget extends StatelessWidget {
  const MobileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      BlocBuilder<HeaderBloc, HeaderState>(builder: (context, state) {
        return IconButton.outlined(
            onPressed: () {
              if (state is MenuOpened) {
                context
                    .read<DashboardBloc>()
                    .add(ScrollToWidgetEvent(headerKey));
                context.read<HeaderBloc>().add(SideMenuClose());
              } else {
                context.read<HeaderBloc>().add(SideMenuOpen());
              }
            },
            icon: Icon(
                state is MenuOpened ? Icons.keyboard_arrow_down : Icons.menu));
      }),
    ]);
  }
}

class DrawerList extends StatelessWidget {
  const DrawerList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: Constants().headerList.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            switch (Constants().headerList[index]) {
              case 'Hello':
                context
                    .read<DashboardBloc>()
                    .add(ScrollToWidgetEvent(helloKey));
                break;
              case 'About':
                context
                    .read<DashboardBloc>()
                    .add(ScrollToWidgetEvent(aboutmeKey));
                break;
              case 'Experiance':
                context
                    .read<DashboardBloc>()
                    .add(ScrollToWidgetEvent(experianceKey));
                break;
              case 'Portfolio':
                context
                    .read<DashboardBloc>()
                    .add(ScrollToWidgetEvent(portfolioKey));
                break;
              default:
            }
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Text(
              Constants().headerList[index],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.spMax),
            ),
          ),
        );
      },
    );
  }
}
