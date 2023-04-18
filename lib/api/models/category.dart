import 'package:enterprise_architecture/api/models/products.dart';

class ProductDetails{
  late String categoryName;
  late List<Products> products;

  ProductDetails({
    required this.categoryName,
    required this.products,
  });

  ProductDetails.fromMap(Map<String, dynamic> map) {

    categoryName = map['categoryName'] as String;

    products =[];
    for (var element in (map['products'] as List)) {
      products.add(Products.fromMap(element));
    }

  }

  Map<String,dynamic> toMap(){

    List productlist =[];
    for (var element in products) {
      productlist.add(element.toMap());
    }

    Map<String,dynamic> map={
      "categoryName" : categoryName,
    };
    return map;
  }
}