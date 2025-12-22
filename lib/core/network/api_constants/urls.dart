class ApiUrls {
  ApiUrls._(); // Private constructor

  static final ApiUrls instance = ApiUrls._();

  static const String baseUrl = 'https://yourapi.com/api';

  // Auth endpoints
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String logout = '/auth/logout';

  // User endpoints
  static const String getUser = '/user';
  static const String getUsers = '/users';
  static const String updateUser = '/user/update';
  static const String deleteUser = '/user/delete';

  // Product endpoints
  static const String getProducts = '/products';
  static const String getProductDetail = '/products/detail';
  static const String addProduct = '/products/add';
  static const String updateProduct = '/products/update';
  static const String deleteProduct = '/products/delete';

  // Order endpoints
  static const String getOrders = '/orders';
  static const String getOrderDetail = '/orders/detail';
  static const String createOrder = '/orders/create';
  static const String updateOrder = '/orders/update';
  static const String cancelOrder = '/orders/cancel';

  // Add more endpoints as needed
}