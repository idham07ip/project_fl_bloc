import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_fl_bloc/pages/welcome/bloc/welcome_events.dart';
import 'package:project_fl_bloc/pages/welcome/bloc/welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  WelcomeBloc() : super(WelcomeState()) {
    on<WelcomeEvent>(((event, emit) {
      emit(WelcomeState(page: state.page));
    }));
  }
}
