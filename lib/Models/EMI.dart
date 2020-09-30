import 'package:emi_tracker/Models/Sales.dart';
import 'package:emi_tracker/Models/Notifies.dart';

class EMI {
  int shopID;
  int id;
  DateTime date;
  Sales sales;
  int amount;
  Notifies notifies;

  EMI(
      {this.id,
      this.shopID,
      this.date,
      this.sales,
      this.amount,
      this.notifies});

  factory EMI.fromJson(Map<String, dynamic> json) {
    return EMI(
        id: json['id'],
        shopID: json['shopID'],
        date: json['date'],
        sales: json['sales'],
        amount: json['amount'],
        notifies: json['notifies']);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'shopID': shopID,
        'date': date,
        'sales': sales,
        'amount': amount,
        'notifies': notifies
      };
}
