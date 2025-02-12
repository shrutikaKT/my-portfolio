import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'portfolio_event.dart';
part 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  PortfolioBloc() : super(ProjectDetailsInVisibleState()) {
    on<MouseOverImageEvent>(overImage);
    on<MouseOutImageEvent>(exitImage);
    on<HideProjectDetailsEvent>(hideDetails);
  }

  overImage(MouseOverImageEvent event, Emitter<PortfolioState> emit) {
    emit(ImageOverOnState());
  }

  exitImage(MouseOutImageEvent event, Emitter<PortfolioState> emit) {
    emit(ImageOverExitState());
  }

  hideDetails(HideProjectDetailsEvent event, Emitter<PortfolioState> emit) {
    if (event.hide) {
      emit(ProjectDetailsInVisibleState());
    } else {
      emit(ProjectDetailsVisibleState());
    }
  }
}
