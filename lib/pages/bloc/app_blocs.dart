import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_fl_bloc/pages/bloc/app_events.dart';
import 'package:project_fl_bloc/pages/bloc/app_states.dart';

class AppBlocs extends Bloc<AppEvents, AppStates> {
  AppBlocs() : super(AppStates()) {
    on<TriggerAppEvents>((event, emit) {
      print("My tapped index Application is ${event.index}");
      emit(AppStates(index: event.index));
    });
  }
}
