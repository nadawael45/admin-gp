class CategoryModel{
  String? id,image,name;

  CategoryModel({ this.id,this.image,this.name});

CategoryModel.fromJson(Map<String, dynamic>json){
  id=json['id'];
  image=json['image'];
  name=json['name'];


}
toJson(categoryid){
  return {
    'id':categoryid,
    'image':image,
    'name':name
  };
}
}
