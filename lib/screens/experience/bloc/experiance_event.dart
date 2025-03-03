part of 'experiance_bloc.dart';

class ExperianceEvent extends Equatable {
  @override
  List<Object?> get props => [];

}

class ChangePageIndex extends ExperianceEvent {
  final int index;
  ChangePageIndex(this.index);
  @override
  List<Object?> get props => [index];
}
