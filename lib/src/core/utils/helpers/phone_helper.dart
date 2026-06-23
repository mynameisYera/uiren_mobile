/// Normalizes a phone string for the auth API.
/// Backend accepts +, spaces, brackets and normalizes internally.
String formatPhoneForApi(String phone) {
  final digits = phone.replaceAll(RegExp(r'[^\d]'), '');

  if (digits.length == 11 && digits.startsWith('8')) {
    return '+7${digits.substring(1)}';
  }
  if (digits.length == 11 && digits.startsWith('7')) {
    return '+$digits';
  }
  if (digits.length == 10) {
    return '+7$digits';
  }
  if (digits.isNotEmpty) {
    return '+$digits';
  }
  return phone.trim();
}

bool isPhoneComplete(String phone) {
  final digits = phone.replaceAll(RegExp(r'[^\d]'), '');
  return digits.length == 11 && (digits.startsWith('7') || digits.startsWith('8'));
}
