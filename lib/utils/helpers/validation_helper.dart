class FormValidator {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return "Email is required";
    final emailRegex = RegExp(r'^\S+@\S+\.\S+$');
    if (!emailRegex.hasMatch(value)) return "Enter a valid email";
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.length < 6) {
      return "Minimum 6 characters required";
    }
    return null;
  }
}
