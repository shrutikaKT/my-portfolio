import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'about_event.dart';
part 'about_state.dart';

class AboutBloc extends Bloc<AboutEvent, AboutState> {
  AboutBloc() : super(OpacityRemoved()) {
    on<OnMouseOverIn>(addOpacity);
    on<OnMouseOverOut>(removeOpacity);
  }


  addOpacity(OnMouseOverIn event, Emitter<AboutState> emit) {
    emit(OpacityAdded());
  }

  removeOpacity(OnMouseOverOut event, Emitter<AboutState> emit) {
    emit(OpacityRemoved());
  }
}
