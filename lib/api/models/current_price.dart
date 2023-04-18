import 'package:enterprise_architecture/api/models/text_price.dart';

class PriceList{
  late TextPrice current;
  late String currency;

  PriceList({required this.current , required this.currency});

  PriceList.fromMap(Map<String, dynamic> map){
    current =TextPrice.fromMap(map['current']);
    currency = map['currency'];
  }

  Map<String , dynamic> toMap(){
    Map<String,dynamic> map={
      'current': current.toMap(),
      "currency" : currency,
    };
    return map;
  }
}