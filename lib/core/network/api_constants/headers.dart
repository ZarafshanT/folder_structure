class ApiHeaders {
  ApiHeaders._(); // Private constructor

  static final ApiHeaders instance = ApiHeaders._();

  static const Map<String, String> jsonHeaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  // Example for auth header
  static Map<String, String> authHeaders(String token) => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  };

  // Add more header types as needed
}