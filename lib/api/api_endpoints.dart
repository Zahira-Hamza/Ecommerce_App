class ApiEndpoints {
  static const String baseUrl = "https://ecommerce.routemisr.com/api/v1/";
  static const String signin = "auth/signin";
  static const String signup = "auth/signup";
  static const String categoriesApi = "categories";
  static const String brandsApi = "brands";
  static const String productsApi = "products";
  static const String add_productApi = "cart";
  static const String add_user_cartApi = "cart";
  static const String delete_item_cartApi = "cart/{productId}";
  static const String update_item_count_cartApi = "cart/{productId}";
}
