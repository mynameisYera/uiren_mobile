class EndPoints {
  static const String baseUrl = 'https://uiren-backend.onrender.com/api';

  // Refresh token
  static const String refreshToken = '/auth/refresh';

  // Register
  static const String registerRequestOtp = '/auth/register/request-otp';
  static const String registerVerifyOtp = '/auth/register/verify-otp';
  static const String register = '/auth/register/complete';

  // password reset
  static const String passwordResetRequestOtp = '/auth/restore-password/request-otp';
  static const String passwordReset = '/auth/restore-password/complete';

  // Login
  static const String login = '/auth/login';

  // Profile
  static const String profile = '/auth/me';

  
}
