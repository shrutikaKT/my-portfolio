part of 'dashboard_bloc.dart';

class DashboardEvent {}

class ScrollToWidgetEvent extends DashboardEvent {
  final GlobalKey key;
  ScrollToWidgetEvent(this.key);
}

class AboutMeVisible extends DashboardEvent {}

class AboutMeInVisible extends DashboardEvent {}
