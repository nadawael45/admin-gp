class OrderUserModel{

  String? comment,location,date,name,phone,userid,street,state;
  int? total;

  OrderUserModel({this.comment, this.location, this.date, this.name, this.phone,
      this.userid, this.street, this.total});

  OrderUserModel.fromJson(Map<String, dynamic>json){
    name = json['userName'];
    userid = json['userId'];
    street = json['userStreet'];
    location = json['userLocation'];
    phone = json['userPhone'];
    comment = json['comment'];
    date = json['date'];
    total = json['Total'];
    state = json['state'];



  }

}

