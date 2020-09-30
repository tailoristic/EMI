class User {
  int id;
  String userName;
  String password;

  User({this.id, this.userName, this.password});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() =>
      {'id': id, 'userName': userName, 'password': password};
}
