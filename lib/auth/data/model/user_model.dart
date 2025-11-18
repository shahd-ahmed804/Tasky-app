class UserModel{
  static const String collection = "Users";
  UserModel({
     this.name,
     this.email,
     this.password,
     this.id,
});
  String? name;
  String? email;
  String? password;
  String? id;

 factory UserModel.fromJson(Map<String,dynamic>json){
    return UserModel(name: json['name'],
        email: json['email'],
        password: json['password'],
        id: json['id']);
  }
  Map<String,dynamic>toJson()=>{
  'name' : name,
  'password': password,
  'id':id,
  'email': email,
  };
}