import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_fl_bloc/pages/register/bloc/register_events.dart';
import 'package:project_fl_bloc/pages/register/bloc/register_states.dart';

class RegisterBlocs extends Bloc<RegisterEvent, RegisterState> {
  RegisterBlocs() : super(RegisterState()) {
    //Handler
    on<UserNameEvent>(_UserNameEvent);
    on<EmailRegisEvent>(_EmailRegisEvent);
    on<PasswordEvent>(_PasswordEvent);
    on<ConfirmPassword>(_ConfirmPasswordEvent);
  }

  void _UserNameEvent(UserNameEvent event, Emitter<RegisterState> emit) {
    print("${event.userName}");
    emit(state.copyWith(userNameCopyWith: event.userName));
  }

  void _EmailRegisEvent(EmailRegisEvent event, Emitter<RegisterState> emit) {
    print("${event.emailEvent}");
    emit(state.copyWith(emailAddressCopyWith: event.emailEvent));
  }

  void _PasswordEvent(PasswordEvent event, Emitter<RegisterState> emit) {
    print("${event.passwordEvent}");
    emit(state.copyWith(passwordCopyWith: event.passwordEvent));
  }

  void _ConfirmPasswordEvent(
      ConfirmPassword event, Emitter<RegisterState> emit) {
    print("${event.confirmPasswordEvent}");
    emit(state.copyWith(confirmPasswordCopyWith: event.confirmPasswordEvent));
  }
}
