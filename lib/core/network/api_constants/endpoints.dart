import 'package:folder_structure/core/network/api_constants/urls.dart';

class ApiEndpoints {
  ApiEndpoints._(); // Private constructor

  static final ApiEndpoints instance = ApiEndpoints._();

  // Grouped endpoints for better organization
  static List<String> authEndpoints = [
    ApiUrls.login,
    ApiUrls.register,
    ApiUrls.logout,
  ];

  static List<String> userEndpoints = [
    ApiUrls.getUser,
    ApiUrls.getUsers,
    ApiUrls.updateUser,
    ApiUrls.deleteUser,
  ];

  static List<String> productEndpoints = [
    ApiUrls.getProducts,
    ApiUrls.getProductDetail,
    ApiUrls.addProduct,
    ApiUrls.updateProduct,
    ApiUrls.deleteProduct,
  ];

  static List<String> orderEndpoints = [
    ApiUrls.getOrders,
    ApiUrls.getOrderDetail,
    ApiUrls.createOrder,
    ApiUrls.updateOrder,
    ApiUrls.cancelOrder,
  ];

  // Add more grouped endpoints as needed
}
