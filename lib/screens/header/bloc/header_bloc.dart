import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'header_event.dart';
part 'header_state.dart';

class HeaderBloc extends Bloc<HeaderEvent, HeaderState> {
  HeaderBloc() : super(MenuClosed()) {
    initializeTheme();
    on<SideMenuOpen>(openMenu);
    on<SideMenuClose>(closeMenu);
    on<GetThemeMode>(changeMode);
  }

  void initializeTheme() {
    emit(DarkModeActivated());
  }

  openMenu(SideMenuOpen event, Emitter<HeaderState> emit) {
    emit(MenuOpened());
  }

  closeMenu(SideMenuClose event, Emitter<HeaderState> emit) {
    emit(MenuClosed());
  }

  changeMode(GetThemeMode event, Emitter<HeaderState> emit) async {
    AdaptiveThemeMode? mode = await AdaptiveTheme.getThemeMode();
    if (mode!.isDark) {
      emit(DarkModeActivated());
    } else {
      emit(LightModeActivated());
    }
  }
}
