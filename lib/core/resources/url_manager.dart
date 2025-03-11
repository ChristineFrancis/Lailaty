class UrlManager {
  //! auth
  static const String baseAuthUrl =
      'https://laylaty.almowafraty.com/api/v1/auth';
  static String emailRegisterURL = '$baseAuthUrl/emailRegistration';
  static String verifyEmailURL = '$baseAuthUrl/verifyEmail';
  static String resendVerificationCodeURL =
      '$baseAuthUrl/resendVerificationCode';
  static String loginURL = '$baseAuthUrl/login';
  static String forgotPasswordURL = '$baseAuthUrl/forgot-password';
}
