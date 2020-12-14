import 'package:get/get.dart';
import 'package:getxApi/models/product.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  static var client = http.Client();

  static Future<List<Product>> fetchProducts() async {
    // you will get some response from the internet so you need to store the information on some variable
    var response = await client.get(
        'http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline');

    if (response.statusCode == 200) {
      var jsonString = response
          .body; // This is the place where we will be getting the entire json response data

      // Returning the list of products from json by converting it from the model in Product Model
      return productFromJson(jsonString);
    } else {
      // showing user the error message
      Get.snackbar(
        'Error',
        'Something went wrong while fetching the data',
        snackPosition: SnackPosition.BOTTOM,
      );
      return null;
    }
  }

  static void fetchProduct() async {
    var response = await client.get(
        "http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline");
    // print(response.body);
    // Now we get the json as a response from the api
    // Now we need to parse the json to our Product model
    if (response.statusCode == 200) {
    } else {
      Get.snackbar("Error", "Error Retreving the data from the internet");
    }
  }
}
