class UrlManager {
  static const String baseUrl = 'https://laylaty.almowafraty.com/api/v1';
  // static String emailRegisterURL = '$baseAuthUrl/auth/emailRegistration';
  // static String verifyEmailURL = '$baseAuthUrl/auth/verifyEmail';
  // static String resendVerificationCodeURL =
  //     '$baseAuthUrl/auth/resendVerificationCode';
  // static String loginURL = '$baseAuthUrl/auth/login';
  // static String getBrandUrl = '$baseAuthUrl/captain/vehicles/brand';
  static String addVeicleUrl = '$baseUrl/captain/vehicles/create';
  // static String forgotPasswordURL = '$baseAuthUrl/auth/forgot-password';
  static const String captianRegisterUrl = '$baseUrl/captain/Documents';
  //!new auth :

  static const String baseAuthUrl =
      'https://laylaty.almowafraty.com/api/v1/auth';
  static String emailRegisterURL = '$baseAuthUrl/emailRegistration';
  static String verifyEmailURL = '$baseAuthUrl/verifyEmail';
  static String resendVerificationCodeURL =
      '$baseAuthUrl/resendVerificationCode';
  static String loginURL = '$baseAuthUrl/login';
  static String forgotPasswordURL = '$baseAuthUrl/forgot-password';
  static String logoutURL = '$baseAuthUrl/logout';
  static String infoRegisterURL = '$baseAuthUrl/informationRegistration';

// fleet:
  static const String createFleetCompany =
      '$baseUrl/captain/offices/create/company';
  static const String createFleetPersonal =
      '$baseUrl/captain/offices/create/personal';
  static const String openStreetMapSearch =
      "https://nominatim.openstreetmap.org/search?format=json&q=";
  static const String getAllFleets = '$baseUrl/captain/works/fleet-owner/index';
}
