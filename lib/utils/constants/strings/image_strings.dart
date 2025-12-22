class ImageStrings {
  ImageStrings._(); // Private constructor

  static final ImageStrings instance = ImageStrings._();

  // Base paths
  static const String _imagesBase = 'assets/images/';
  static const String _iconsBase = 'assets/icons/';

  // App logo
  static const String appLogo = '${_imagesBase}app_logo.png';

  // User images
  static const String userAvatar = '${_imagesBase}user_avatar.png';
  static const String userPlaceholder = '${_imagesBase}user_placeholder.png';

  // Product images
  static const String productPlaceholder =
      '${_imagesBase}product_placeholder.png';

  // Backgrounds
  static const String backgroundMain = '${_imagesBase}background_main.jpg';

  // Icons
  static const String iconHome = '${_iconsBase}home.png';
  static const String iconProfile = '${_iconsBase}profile.png';

  // Add more image paths as needed
}
