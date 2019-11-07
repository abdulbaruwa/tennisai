
class NavigateToEmailSignUpAction{}
class NavigateToEmailSignInAction{}
class NavigateToRegistrationAction{}
class SignUpCompletedAction{
  final String email;
  final String uid;
  SignUpCompletedAction(this.email, this.uid);
}