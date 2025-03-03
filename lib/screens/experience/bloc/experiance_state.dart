part of 'experiance_bloc.dart';

class ExperianceState {}

final class ExperianceInitial extends ExperianceState {}

final class LoadingIndicator extends ExperianceState {}

class PageUpdatedState extends ExperianceState {
  final int currentPageIndex;
  PageUpdatedState(this.currentPageIndex);
}