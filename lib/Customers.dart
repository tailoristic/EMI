// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'CustomerCRUD.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:emi_tracker/Models/Customer.dart';

// class CustomersDisplay extends StatefulWidget {
//   @override
//   _CustomersDisplayState createState() => _CustomersDisplayState();
// }

// class _CustomersDisplayState extends State<CustomersDisplay> {
//   var dataSource = CustomerDataSource()._getCustomerList();
//   int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Customers'),
//       ),
//       resizeToAvoidBottomInset: true,
//       resizeToAvoidBottomPadding: false,
//       floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.add),
//           onPressed: () {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => Customers()));
//           }),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: PaginatedDataTable(
//             source: CustomerDataSource(),
//             rowsPerPage: _rowsPerPage,
//             availableRowsPerPage: <int>[5, 10, 20],
//             header: Text("Customer List"),
//             columns: [
//               DataColumn(label: Text("Id")),
//               DataColumn(label: Text("Name")),
//               DataColumn(label: Text("Mob No")),
//             ],
//             // source: dataSource,
//             onRowsPerPageChanged: (int value) {
//               setState(() {
//                 _rowsPerPage = value;
//               });
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CustomerDataSource extends DataTableSource {
//   List<Customer> customers;

//   Future<List<Customer>> _getCustomerList() async {
//     final session = await SharedPreferences.getInstance();
//     String shopId = session.getInt('shopId').toString();
//     await Firebase.initializeApp();

//     QuerySnapshot snapshot = await FirebaseFirestore.instance
//         .collection("Customers")
//         .where('shopId', isEqualTo: shopId)
//         .orderBy('createdAt', descending: true)
//         .get();

//     if (snapshot.docs.length > 0) {
//       snapshot.docs.forEach((customer) {
//         customers.add(Customer.fromJson(customer.data()));
//       });
//     }
//     return customers;
//   }

//   @override
//   DataRow getRow(int index) {
//     return DataRow.byIndex(index: index, cells: [
//       DataCell(Text('${customers[index].id}')),
//       DataCell(Text('${customers[index].name}')),
//       DataCell(Text('${customers[index].gMobNo1}/{+ customers[index].mobNo2}')),
//     ]);
//   }

//   @override
//   int get rowCount => 100;

//   @override
//   bool get isRowCountApproximate => false;

//   @override
//   int get selectedRowCount => 0;
// }
