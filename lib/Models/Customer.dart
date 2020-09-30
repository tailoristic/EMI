class Customer {
  int id;
  int shopId;
  String name;
  String address;
  int mobNo1;
  int mobNo2;
  String pic;
  String gName;
  String gAddress;
  int gMobNo1;
  int gMobNo2;
  String gPic;

  Customer(
      {this.id,
      this.shopId,
      this.name,
      this.address,
      this.mobNo1,
      this.mobNo2,
      this.pic,
      this.gName,
      this.gAddress,
      this.gMobNo1,
      this.gMobNo2,
      this.gPic});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopId = json['shopId'];
    name = json['name'];
    address = json['address'];
    mobNo1 = json['mobNo1'];
    mobNo2 = json['mobNo2'];
    pic = json['pic'];
    gName = json['gName'];
    gAddress = json['gAddress'];
    gMobNo1 = json['gMobNo1'];
    gMobNo2 = json['gMobNo2'];
    gPic = json['gPic'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'shopId': shopId,
        'name': name,
        'address': address,
        'mobNo1': mobNo1,
        'mobNo2': mobNo2,
        'pic': pic,
        'gName': gName,
        'gAddress': gAddress,
        'gMobNo1': gMobNo1,
        'gMobNo2': gMobNo2,
        'gPic': gPic
      };
}
