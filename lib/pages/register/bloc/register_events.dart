abstract class RegisterEvent {
  const RegisterEvent();
}

class UserNameEvent extends RegisterEvent {
  final String userName;
  const UserNameEvent(this.userName);
}

class EmailRegisEvent extends RegisterEvent {
  final String emailEvent;
  const EmailRegisEvent(this.emailEvent);
}

class PasswordEvent extends RegisterEvent {
  final String passwordEvent;
  const PasswordEvent(this.passwordEvent);
}

class ConfirmPassword extends RegisterEvent {
  final String confirmPasswordEvent;
  const ConfirmPassword(this.confirmPasswordEvent);
}
