import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sezon_app/app/modules/product/widgets/product_widget.dart';
import 'package:sezon_app/models/product.dart';

class ShowProducts extends StatelessWidget {
   ShowProducts({
    super.key,
     required this.products,
  });
  List<Product>  products=[];


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: products.length,
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 19.w,
          mainAxisSpacing: 19.h,
        ),
        itemBuilder: (context, index) {

          return ProductWidget(isHome: true,product: products[index],oldProduct:products[index] ,);
          // return Text('data');
        },
      ),
    );
  }
}
