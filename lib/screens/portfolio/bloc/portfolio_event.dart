part of 'portfolio_bloc.dart';

class PortfolioEvent {}

class MouseOverImageEvent extends PortfolioEvent {}

class MouseOutImageEvent extends PortfolioEvent {}

class HideProjectDetailsEvent extends PortfolioEvent {
  final bool hide;
  HideProjectDetailsEvent(this.hide);
}
