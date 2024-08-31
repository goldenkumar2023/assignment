import 'package:http/http.dart' as http;

import '../models/product.dart';

class ApiService {
  final String baseUrl = "https://dummyjson.com/products";

  Future<ProductModel?> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        return productModelFromJson(response.body);
      } else {
        throw Exception("Failed to load products");
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}
