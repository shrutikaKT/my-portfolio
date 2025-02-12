import 'package:flutter_bloc/flutter_bloc.dart';

part 'common_button_event.dart';
part 'common_button_state.dart';

class CommonButtonBloc extends Bloc<CommonButtonEvent, CommonButtonState> {
  CommonButtonBloc() : super(CommonButtonInitial()) {
    on<CommonButtonEvent>((event, emit) {
    });
  }
}
