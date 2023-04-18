class TextPrice {

  late String text;
  late double value;

  TextPrice({required this.text, required this.value});

  TextPrice.fromMap(Map<String, dynamic> map){
    text = map['text'] ;
    value = map['value'] ;
  }

  Map<String , dynamic> toMap(){
    Map<String, dynamic> map={
      "text" : text,
      "value" : value,
    };
    return map;
  }
}