class ProDetails{

  late String name;
  late int id;
  late String description;

  ProDetails({
    required this.name,
    required this.id,
    required this.description,
  });

  ProDetails.fromMap(Map<String, dynamic> map) {

    id = map['id'];
    name = map['categoryName'];
    description = map['description'].toString();

  }

  Map<String,dynamic> toMap(){
    Map<String,dynamic> map={
      "id" : id ,
      "name" : name,
      "description" : description,
    };
    return map;
  }
}