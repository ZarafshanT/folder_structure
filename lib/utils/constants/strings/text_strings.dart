class TextStrings {
  TextStrings._(); // Private constructor

  static final TextStrings instance = TextStrings._();

  // Common
  static const String appName = 'My App';
  static const String ok = 'OK';
  static const String cancel = 'Cancel';
  static const String yes = 'Yes';
  static const String no = 'No';

  // Auth
  static const String login = 'Login';
  static const String register = 'Register';
  static const String logout = 'Logout';
  static const String emailHint = 'Enter your email';
  static const String passwordHint = 'Enter your password';
  static const String forgotPassword = 'Forgot Password?';
  static const String rememberMe = 'Remember me';

  // Errors
  static const String errorNetwork = 'Network error. Please try again.';
  static const String errorInvalidCredentials = 'Invalid credentials.';
  static const String errorRequiredField = 'This field is required.';
  static const String errorServer = 'Server error. Please try later.';
  static const String errorNotFound = 'No data found.';
  static const String errorUnauthorized = 'You are not authorized.';

  // Success
  static const String successLogin = 'Login successful!';
  static const String successRegister = 'Registration successful!';
  static const String successUpdate = 'Updated successfully!';
  static const String successDelete = 'Deleted successfully!';

  // Validation
  static const String validationEmail = 'Please enter a valid email address.';
  static const String validationPassword =
      'Password must be at least 6 characters.';

  // Dialogs
  static const String dialogLogoutTitle = 'Logout';
  static const String dialogLogoutMessage = 'Are you sure you want to logout?';
  static const String dialogDeleteTitle = 'Delete';
  static const String dialogDeleteMessage =
      'Are you sure you want to delete this item?';

  // Loading
  static const String loading = 'Loading...';
  static const String pleaseWait = 'Please wait...';

  // Empty States
  static const String emptyList = 'No items found.';
  static const String emptyNotifications = 'No notifications yet.';

  // Instructions
  static const String swipeToRefresh = 'Swipe down to refresh';
  static const String tapToEdit = 'Tap to edit';
  static const String longPressOptions = 'Long press for options';

  // Add more text strings as needed
}
