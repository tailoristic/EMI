import 'package:flutter/material.dart';
import 'sales_details.dart';

class SalesDisplay extends StatefulWidget {
  @override
  _SalesDisplayState createState() => _SalesDisplayState();
}

class _SalesDisplayState extends State<SalesDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emi'),
      ),
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: false,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SalesDetails()));
          }),
      body: SingleChildScrollView(),
    );
  }
}
