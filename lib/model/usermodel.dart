class UserModel{
  String? name;
  String? email;
  String? uid;
  String? phone;
  UserModel({
    this.email,
    this.uid,
    this.name,
    this.phone,
  });
 factory UserModel.fromJson(Map<String,dynamic> json){
    return UserModel(
      name: json['name'],
      email: json['email'],
      uid: json['uid'],
      phone: json['phone'],
    );
  }

  Map<String,dynamic> toJson(){
    return {
      'name':name,
      'email':email,
      'phone':phone,
    };
  }
}
