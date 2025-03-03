import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'experiance_event.dart';
part 'experiance_state.dart';

class ExperianceBloc extends Bloc<ExperianceEvent, ExperianceState> {
  int index = 0;
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  ExperianceBloc() : super(ExperianceInitial()) {
    on<ExperianceEvent>((event, emit) {});
    on<ChangePageIndex>(pageClicked);
  }

  pageClicked(ChangePageIndex event, Emitter<ExperianceState> emit) {
    index = event.index;
    emit(PageUpdatedState(index));
  }
}
