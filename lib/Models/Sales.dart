import 'package:emi_tracker/Models/Customer.dart';

class Sales {
  int id;
  int shopID;
  DateTime date;
  String accountNo;
  Customer customer = new Customer();
  String description;
  int price;
  int downPayment;
  int fileCharge;
  int emiInterest;
  int emiMonths;
  DateTime emiDate;

  Sales(
      {this.id,
      this.shopID,
      this.date,
      this.accountNo,
      this.customer,
      this.description,
      this.price,
      this.downPayment,
      this.fileCharge,
      this.emiInterest,
      this.emiMonths,
      this.emiDate});

  factory Sales.fromJson(Map<String, dynamic> json) {
    return Sales(
        id: json['id'],
        shopID: json['shopID'],
        date: json['date'],
        accountNo: json['accountNo'],
        customer: json['customer'],
        description: json['description'],
        price: json['price'],
        downPayment: json['downPayment'],
        fileCharge: json['fileCharge'],
        emiInterest: json['emiInterest'],
        emiMonths: json['emiMonths'],
        emiDate: json['emiDate']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'shopID': shopID,
        'date': date,
        'accountNo': accountNo,
        'customer': customer,
        'description': description,
        'price': price,
        'downPayment': downPayment,
        'fileCharge': fileCharge,
        'emiInterest': emiInterest,
        'emiMonths': emiMonths,
        'emiDate': emiDate
      };
}
