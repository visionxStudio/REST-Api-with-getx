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
