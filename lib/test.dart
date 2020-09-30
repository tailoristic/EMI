import 'package:flutter/material.dart';

class IPaginatedTable extends StatefulWidget {
  @override
  _IPaginatedTableState createState() => _IPaginatedTableState();
}

class _IPaginatedTableState extends State<IPaginatedTable> {
  var dts = DTS();
  int _rowPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: PaginatedDataTable(
            header: Text("Data Table Header"),
            columns: [
              DataColumn(label: Text("Id")),
              DataColumn(label: Text("Name")),
              DataColumn(label: Text("Mob No")),
            ],
            source: dts,
            onRowsPerPageChanged: (r) {
              setState(() {
                _rowPerPage = r;
              });
            },
            rowsPerPage: _rowPerPage,
          ),
        ),
      ),
    );
  }
}

/////////////
class DTS extends DataTableSource {
  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text("#cell$index")),
      DataCell(Text("#cel2$index")),
      DataCell(Text("#cel3$index")),
      DataCell(Text("#cel4$index")),
    ]);
  }

  @override
  bool get isRowCountApproximate => true;

  @override
  int get rowCount => 100;

  @override
  int get selectedRowCount => 0;
}
