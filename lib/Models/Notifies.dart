class Notifies {
  int id;
  String shopId;
  String name;
  String accountNo;
  DateTime remindDate;
  int emi;
  int pending;

  Notifies(
      {this.id,
      this.shopId,
      this.name,
      this.accountNo,
      this.remindDate,
      this.emi,
      this.pending});

  factory Notifies.fromJson(Map<String, dynamic> json) {
    return Notifies(
        id: json['id'],
        shopId: json['shopId'],
        name: json['name'],
        accountNo: json['accountNo'],
        remindDate: json['remindDate'],
        emi: json['emi'],
        pending: json['pending']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'shopId': shopId,
        'name': name,
        'accountNo': accountNo,
        'remindDate': remindDate,
        'emi': emi,
        'pending': pending
      };
}
