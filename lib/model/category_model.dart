class CategoryModel{
  String?id;
  String? image;
  String? category;
  CategoryModel({
    required this.image,
    required this.category,
    this.id,
  });
    CategoryModel.fromJson(Map<String, dynamic> json) {
    image=json['image'];
    category=json['category'];
    id=json['id'];
  }
    Map<String,dynamic> toJson(){
    return {
      'image':image,
      'category':category,
      'id':id,
    };
  }
}