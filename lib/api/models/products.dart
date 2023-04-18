import 'current_price.dart';

class Products{
  late int id;
  late String name;
  late PriceList price;
  late String imageUrl;
  late String colour;
  late String url;
  late String brandName;
  late int productCode;

  Products({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.colour,
    required this.url,
    required this.brandName,
    required this.productCode,
  });
  Products.fromMap(Map<String, dynamic> map) {
    id = map['id'] ;
    name = map['name'] ;
    colour = map['colour'] ;
    brandName = map['brandName'] ;
    url = map['url'] ;
    productCode = map['productCode'] ;
    price =PriceList.fromMap(map["price"]);
    imageUrl = map['imageUrl'] ;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'price': price.toMap(),
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'colour': colour,
      'brandName': brandName,
      'url': url,
      'productCode': productCode,
    };
    return map;
  }
}