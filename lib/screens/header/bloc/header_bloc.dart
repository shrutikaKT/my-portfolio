import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'header_event.dart';
part 'header_state.dart';

class HeaderBloc extends Bloc<HeaderEvent, HeaderState> {
  HeaderBloc() : super(MenuClosed()) {
    on<SideMenuOpen>(openMenu);
    on<SideMenuClose>(closeMenu);
  }

  openMenu(SideMenuOpen event, Emitter<HeaderState> emit) {
    emit(MenuOpened());
  }

  closeMenu(SideMenuClose event, Emitter<HeaderState> emit) {
    emit(MenuClosed());
  }
}
