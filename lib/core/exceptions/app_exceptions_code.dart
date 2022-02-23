class AppExceptionsCode {
  AppExceptionsCode._();

  static String invalidEmail = 'invalid-email';
  static String userDisabled = 'user-disabled';
  static String userNotFound = 'user-not-found';
  static String wrongPassword = 'wrong-password';
  static String emailAlreadyInUse = 'email-already-in-use';
  static String operationNotAllowed = 'operation-not-allowed';
  static String weakPassword = 'weak-password';
  static String tooManyRequests = 'too-many-requests';
  static String networkRequestFailed = 'network-request-failed';

  static String invalidEmailMessage = 'Email inválido!';
  static String userDisabledMessage = 'Usuário desabilitado!';
  static String userNotFoundMessage = 'Usuário não encontrado!';
  static String wrongPasswordMessage = 'Usuário ou senha inválidas!';
  static String emailAlreadyInUseMessage = 'Email já utilizado!';
  static String operationNotAllowedMessage = 'Ative a conta no Firebase!';
  static String weakPasswordMessage = 'Senha precisa ter no mínimo 6 caracteres!';
  static String tooManyRequestsMessage = 'Estamos com instabilidades, tente mais tarde!';
  static String networkRequestFailedMessage = 'Verifique sua conexão com a internet!';

  static String errorSignInGoogleMessage = 'Erro ao logar com o Google!';
  static String errorSignInFacebookMessage = 'Erro ao logar com o Facebook!';

  static String yourConnectionInstabilityMessage = 'Sua conexão apresentou instabilidades!';
}
