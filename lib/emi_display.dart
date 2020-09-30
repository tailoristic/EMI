import 'package:flutter/material.dart';
import 'emi_page.dart';

class EmiDisplay extends StatefulWidget {
  @override
  _EmiDisplayState createState() => _EmiDisplayState();
}

class _EmiDisplayState extends State<EmiDisplay> {
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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => EmiDetail()));
          }),
      body: SingleChildScrollView(),
    );
  }
}
