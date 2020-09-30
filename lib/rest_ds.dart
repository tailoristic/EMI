// import 'package:flutter/material.dart';
// import 'package:emi_tracker/Models/Customer.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as client;
// import 'dart:convert';

// class DataTableExample extends StatefulWidget {
//   const DataTableExample({Key key}) : super(key: key);

//   @override
//   _DataTableExampleState createState() => _DataTableExampleState();
// }

// class _DataTableExampleState extends State<DataTableExample> {
//   int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: PaginatedDataTable(
//         header: Text('Customer List'),
//         rowsPerPage: _rowsPerPage,
//         availableRowsPerPage: <int>[5, 10, 20],
//         onRowsPerPageChanged: (int value) {
//           setState(() {
//             _rowsPerPage = value;
//           });
//         },
//         columns: customersTable,
//         source: CustomerDataSource(),
//       ),
//     );
//   }
// }

// const customersTable = <DataColumn>[
//   DataColumn(label: const Text('Id'), numeric: true),
//   DataColumn(label: const Text('Name')),
//   DataColumn(label: const Text('Mob No'))
// ];

// class CustomerDataSource extends DataTableSource {
//   int _selectedCount = 0;
//   List<Customer> _customers = <Customer>[];

//   @override
//   DataRow getRow(int index) {
//     assert(index >= 0);
//     if (index >= _customers.length) return null;

//     final session = await SharedPreferences.getInstance();
//     String shopId = session.getInt('shopId').toString();

//     final _url = Uri.parse(
//             "http://emi-tracker-webapi.ap-south-1.elasticbeanstalk.com/api/customer/getCustomerList")
//         .resolveUri(Uri(queryParameters: {"shopId": shopId}));

//     final client.Response response = await client.get(_url);

//     if (response.body != 'null' && response.body != '[]') {
//       final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

//       _customers =
//           parsed.map<Customer>((json) => Customer.fromJson(json)).toList();

//       _customers = (json.decode(response.body) as List)
//               .map((i) => Customer.fromJson(i))
//               .toList() ??
//           [];
//     }

//     final Customer customer = _customers[index];
//     return DataRow.byIndex(index: index, cells: <DataCell>[
//       DataCell(Text('${customer.id}')),
//       DataCell(Text('${customer.name}')),
//       DataCell(Text('${customer.gMobNo1}/{+ customer.mobNo2}')),
//     ]);
//   }

//   @override
//   int get rowCount => _customers.length;

//   @override
//   bool get isRowCountApproximate => false;

//   @override
//   int get selectedRowCount => _selectedCount;
// }
