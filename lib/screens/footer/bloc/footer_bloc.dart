
import 'package:flutter_bloc/flutter_bloc.dart';

part 'footer_event.dart';
part 'footer_state.dart';

class FooterBloc extends Bloc<FooterEvent, FooterState> {
  FooterBloc() : super(FooterInitial()) {
    on<FooterEvent>((event, emit) {
    });
  }
}
