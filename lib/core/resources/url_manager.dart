class UrlManager {
  //! auth
  static const String baseAuthUrl =
      'https://laylaty.almowafraty.com/api/v1';
  static String emailRegisterURL = '$baseAuthUrl/auth/emailRegistration';
  static String verifyEmailURL = '$baseAuthUrl/auth/verifyEmail';
  static String resendVerificationCodeURL =
      '$baseAuthUrl/auth/resendVerificationCode';
  static String loginURL = '$baseAuthUrl/auth/login';
  static String getBrandUrl = '$baseAuthUrl/captain/vehicles/brand';
  static String addVeicleUrl = '$baseAuthUrl/captain/vehicles/create';
  static String forgotPasswordURL = '$baseAuthUrl/auth/forgot-password';
}
