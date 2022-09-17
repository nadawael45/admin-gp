class MyOrdersModel {
  String? orderName, date, img, id,comment;
  var productId;
  int? total, price;
  bool? isFavourite;
  List? extraListName=[];
  MyOrdersModel(
      { this.orderName, this.date,  this.price,this.productId,this.extraListName,
        this.total,  this.img, this.id,this.isFavourite,this.comment

      });


  MyOrdersModel.fromJson(Map<String, dynamic>json){
      orderName=json['ItemName'];
      price=json['Price'];
      img=json['ItemImage'];
      productId=json['ProductId'];
      date=json['date'];


  }



}