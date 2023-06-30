class RegisterState {
  final String userNameState;
  final String emailAddressState;
  final String passwordState;
  final String confirmPasswordState;

  //Optional named parameter
  const RegisterState(
      {this.userNameState = "",
      this.emailAddressState = "",
      this.passwordState = "",
      this.confirmPasswordState = ""});

  RegisterState copyWith({
    String? userNameCopyWith,
    String? emailAddressCopyWith,
    String? passwordCopyWith,
    String? confirmPasswordCopyWith,
  }) {
    return RegisterState(
      userNameState: userNameCopyWith ?? this.userNameState,
      emailAddressState: emailAddressCopyWith ?? this.emailAddressState,
      passwordState: passwordCopyWith ?? this.passwordState,
      confirmPasswordState:
          confirmPasswordCopyWith ?? this.confirmPasswordState,
    );
  }
}
