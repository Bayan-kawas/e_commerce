class UserModel {
  String? userId, name, email, img;

  UserModel({this.userId, this.name, this.email, this.img});

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    userId = map['userId'];
    name = map['name'];
    email = map['email'];

    img = map['img'];
  }

  toJson() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'img': img,
    };
  }
}
