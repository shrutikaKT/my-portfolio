import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/main.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(AboutMeInVisibleState()) {
    on<ScrollToWidgetEvent>(scrollToWidget);
    on<AboutMeVisible>(showAboutMeWidget);
    on<AboutMeInVisible>(hideAboutMeWidget);
  }

  ScrollController scrollController = ScrollController();

  showAboutMeWidget(AboutMeVisible event, Emitter<DashboardState> emit) {
    emit(AboutMeVisibleState());
  }

  hideAboutMeWidget(AboutMeInVisible event, Emitter<DashboardState> emit) {
    emit(AboutMeInVisibleState());
  }

  // Scroll to widget function with delay
  scrollToWidget(
      ScrollToWidgetEvent event, Emitter<DashboardState> emit) async {
    final keyContext = event.key.currentContext;

    if (keyContext != null) {
      final context = event.key.currentContext;
      if (context != null) {
        Scrollable.ensureVisible(context,
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      }
      if (event.key == aboutmeKey) {
        emit(AboutMeVisibleState());
      }
      if (event.key == experianceKey) {
        emit(ExperianceVisibleState());
      }
      if (event.key == portfolioKey) {
        emit(PortfolioVisibleState());
      }
    }
  }
}
