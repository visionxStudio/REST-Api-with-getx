import 'package:get/state_manager.dart';
import 'package:getxApi/models/product.dart';
import 'package:getxApi/services/remote_services.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = List<Product>().obs;
  final isFavorite = false.obs;

  void toggleLike() {
    isFavorite.value = isFavorite.value;
  }

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    isLoading(true);
    try {
      var products = await RemoteServices.fetchProducts();

      if (products != null) {
        // productList.value = products;
        productList.assignAll(products);
      }
    } finally {
      isLoading(false);
    }
  }
}

// GetConnect
// GetConnect is an easy way to communicate from your back to your front with http or websockets

// Default configuration
// You can simply extend GetConnect and use the GET/POST/PUT/DELETE/SOCKET methods to communicate with your Rest API or websockets.

// class UserProvider extends GetConnect {
//   // Get request
//   Future<Response> getUser(int id) => get('http://youapi/users/$id');
//   // Post request
//   Future<Response> postUser(Map data) => post('http://youapi/users', body: data);
//   // Post request with File
//   Future<Response<CasesModel>> postCases(List<int> image) {
//     final form = FormData({
//       'file': MultipartFile(image, filename: 'avatar.png'),
//       'otherFile': MultipartFile(image, filename: 'cover.png'),
//     });
//     return post('http://youapi/users/upload', form);
//   }

//   GetSocket userMessages() {
//     return socket('https://yourapi/users/socket');
//   }
// }
