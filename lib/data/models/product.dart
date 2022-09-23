class ProductModel{
   String? name , description , image , id , brand , categoryName,categoryId;
  late int price , discount ;
  double rating = 0 ;
   bool? isFav;
  ProductModel({
     this.id ,
    this.categoryId,
    required this.name ,
    required this.description ,
    required this.image ,
    required this.price ,
     required this.rating,
    required this.discount ,
    required this.brand ,
    required this.categoryName ,
     this.isFav
  });
  ProductModel.fromJson(Map<String , dynamic> json){
    id = json["id"] ;
    name = json["name"] ;
    image = json["image"] ;
    description = json["description"] ;
    price = json["price"] ;
    discount = json["discount"] ;
    brand = json["brand"] ;
    categoryName = json["categoryName"] ;
    //rating = json["rating"];
    categoryId = json["categoryId"];

  }
  toJson(){
    return {
      "id" : id ,
      "name" : name ,
      "image" : image ,
      "description" : description ,
      "price" : price ,
      "discount" : discount ,
      "brand" : brand ,
      "categoryName" : categoryName ,
      "rating" : rating ,
      "categoryId":categoryId
    };
  }
}
