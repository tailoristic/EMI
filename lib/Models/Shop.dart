import 'package:emi_tracker/Models/User.dart';

class Shop {
  int id;
  String name;
  String address;
  String email;
  User user;

  Shop({this.id, this.name, this.address, this.email, this.user});

  Shop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    email = json['email'];
    user = new User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'address': address,
        'email': email,
        'user': user
      };
}
