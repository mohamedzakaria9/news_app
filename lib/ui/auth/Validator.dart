class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return "Email is required";
    if (!value.contains("@gmail.com")) return "Not a valid Gmail";
    return null;
  }

  static String? validatePassword(String? value) {
    final regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$');
    if (value == null || value.isEmpty) return "Password is required";
    if (!regex.hasMatch(value)) return "Password must have upper, lower, number, 8+ chars";
    return null;
  }
}