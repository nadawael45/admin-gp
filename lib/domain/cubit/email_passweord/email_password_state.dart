abstract class EmailPasswordStatus {}


class EmailLoading extends EmailPasswordStatus{}



class EmailLoginSuccess extends EmailPasswordStatus{
  String msg = "Email LoggedIn Successfully" ;
}
class EmailLoginFailed extends EmailPasswordStatus{
  String? msg ;
  EmailLoginFailed({required this.msg});
}

class EmailSignUpSuccess extends EmailPasswordStatus{
  String msg = "Email SignedUp Successfully" ;
}
class EmailSignUpFailed extends EmailPasswordStatus{
  String? msg ;
  EmailSignUpFailed({required this.msg});
}