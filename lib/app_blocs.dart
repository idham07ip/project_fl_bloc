import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_fl_bloc/app_events.dart';
import 'package:project_fl_bloc/app_states.dart';

class AppBlocs extends Bloc<AppEvent, AppStates> {
  AppBlocs() : super(InitStates()) {
    print("App BLoC");
    on<Increment>((event, emit) {
      emit(AppStates(counter: state.counter + 1));
      print(state.counter);
    });

    //
    on<Decrement>((event, emit) {
      emit(AppStates(counter: state.counter - 1));
      print(state.counter);
    });
  }
}
