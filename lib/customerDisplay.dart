import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emi_tracker/CustomerCRUD.dart';
import 'package:flutter/material.dart';

class CustomersDisplay extends StatefulWidget {
  @override
  _CustomersDisplayState createState() => _CustomersDisplayState();
}

class _CustomersDisplayState extends State<CustomersDisplay> {
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> custList;
  var custDocs = List<DocumentSnapshot>();
  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("books");
  @override
  void initState() {
    super.initState();
    subscription = collectionReference.snapshots().listen((datasnapshot) {
      setState(() {
        custList = datasnapshot.docs;
      });
    });

    FirebaseFirestore.instance
        .collectionGroup('books')
        .snapshots()
        .forEach((element) {
      custDocs = element.docs.toList();
    });
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customers'),
      ),
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: false,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Customers(),
            ),
          );
        },
      ),
      body: ListView.builder(
          itemCount: custDocs.length,
          itemBuilder: (context, index) {
            // String custName = custDocs[index].data()['name'];
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: dataTable(),
            );
          }),
    );
  }

  Widget dataTable() {
    return Column(
      children: [
        PaginatedDataTable(
          header: Text('Header Text'),
          rowsPerPage: 4,
          columns: [
            DataColumn(label: Text('Customer Name')),
            DataColumn(label: Text('Customer Address')),
            DataColumn(label: Text('Customer Mobile Number')),
            DataColumn(label: Text('EMI Date')),
          ],
          source: _DataSource(context),
        ),
      ],
    );
  }
}

class _Row {
  _Row(
    this.valueA,
    this.valueB,
    this.valueC,
    this.valueD,
  );

  final String valueA;
  final String valueB;
  final String valueC;
  final int valueD;

  bool selected = false;
}

class _DataSource extends DataTableSource {
  _DataSource(this.context) {
    _rows = <_Row>[
      _Row('Cell A1', 'CellB1', 'CellC1', 1),
      _Row('Cell A2', 'CellB2', 'CellC2', 2),
      _Row('Cell A3', 'CellB3', 'CellC3', 3),
      _Row('Cell A4', 'CellB4', 'CellC4', 4),
    ];
  }

  final BuildContext context;
  List<_Row> _rows;

  int _selectedCount = 0;

  @override
  DataRow getRow(int index) {
    assert(index >= 0);
    if (index >= _rows.length) return null;
    final row = _rows[index];
    return DataRow.byIndex(
      index: index,
      selected: row.selected,
      onSelectChanged: (value) {
        if (row.selected != value) {
          _selectedCount += value ? 1 : -1;
          assert(_selectedCount >= 0);
          row.selected = value;
          notifyListeners();
        }
      },
      cells: [
        DataCell(Text(row.valueA)),
        DataCell(Text(row.valueB)),
        DataCell(Text(row.valueC)),
        DataCell(Text(row.valueD.toString())),
      ],
    );
  }

  @override
  int get rowCount => _rows.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}
