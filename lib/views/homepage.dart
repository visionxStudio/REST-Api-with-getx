import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:getxApi/controllers/productController.dart';
import 'package:getxApi/views/product_tile.dart';

class Homepage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          )
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Heading(title: 'Getx Shop'),
          Expanded(
            child: Obx(() {
              if (productController.isLoading.value)
                return Center(
                  child: CircularProgressIndicator(),
                );
              else
                return StaggeredGridView.countBuilder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  crossAxisCount: 2,
                  itemCount: productController.productList.length,
                  itemBuilder: (context, index) {
                    return ProductTile(productController.productList[index]);
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                );
            }),
          ),
        ],
      ),
    );
  }
}

class Heading extends StatelessWidget {
  final String title;
  const Heading({
    @required this.title,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.view_list_rounded),
                  iconSize: 28.0,
                  onPressed: () {},
                ),
                SizedBox(
                  width: 4.0,
                ),
                IconButton(
                  icon: Icon(Icons.grid_view),
                  iconSize: 28.0,
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
