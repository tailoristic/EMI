import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmiDetail extends StatefulWidget {
  @override
  _EmiDetailState createState() => _EmiDetailState();
}

class _EmiDetailState extends State<EmiDetail> {
  DateTime pickedDate;

  TextEditingController emidetailController;
  var _formkey3 = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
  }

  @override
  void dispose() {
    emidetailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('EMI Details'),
        ),
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
            child: Form(
                key: _formkey3,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
                        child: Column(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.text,
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(20)
                              ],
                              controller: emidetailController,
                              validator: (val) =>
                                  val.isEmpty ? 'TextField is Empty' : null,
                              decoration: InputDecoration(
                                  labelText: "Account No ",
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal,
                                      fontSize: 20.0),
                                  hintText: 'Account No ',
                                  hintStyle: TextStyle(color: Colors.blueGrey),
                                  errorStyle: TextStyle(
                                      color: Colors.redAccent, fontSize: 10.0),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                            ),
                            SizedBox(
                              width: 50.0,
                              height: 10.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: emidetailController,
                              validator: (val) =>
                                  val.isEmpty ? 'TextField is Empty' : null,
                              decoration: InputDecoration(
                                  labelText: "Product Description",
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal,
                                      fontSize: 20.0),
                                  hintText: 'Product Description',
                                  hintStyle: TextStyle(color: Colors.blueGrey),
                                  errorStyle: TextStyle(
                                      color: Colors.redAccent, fontSize: 10.0),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                            ),
                            ListTile(
                              title: Text(
                                  'Date: ${pickedDate.day}/${pickedDate.month}/${pickedDate.year}',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal)),
                              leading: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.teal,
                              ),
                              onTap: _pickDate,
                            ),
                            SizedBox(
                              width: 50.0,
                              height: 10.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: emidetailController,
                              validator: (val) =>
                                  val.isEmpty ? 'TextField is Empty' : null,
                              decoration: InputDecoration(
                                  labelText: "Customer Name",
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal,
                                      fontSize: 20.0),
                                  hintText: 'Customer Name',
                                  hintStyle: TextStyle(color: Colors.blueGrey),
                                  errorStyle: TextStyle(
                                      color: Colors.redAccent, fontSize: 10.0),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                            ),
                            SizedBox(
                              width: 50.0,
                              height: 10.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(15)
                              ],
                              controller: emidetailController,
                              validator: (val) =>
                                  val.isEmpty ? 'TextField is Empty' : null,
                              decoration: InputDecoration(
                                  labelText: "Pending Ammount",
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal,
                                      fontSize: 20.0),
                                  hintText: 'Pending Amount',
                                  hintStyle: TextStyle(color: Colors.blueGrey),
                                  errorStyle: TextStyle(
                                      color: Colors.redAccent, fontSize: 10.0),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                            ),
                            SizedBox(
                              width: 50.0,
                              height: 10.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(15)
                              ],
                              controller: emidetailController,
                              validator: (val) =>
                                  val.isEmpty ? 'Add Emi Amount' : null,
                              decoration: InputDecoration(
                                  labelText: "Emi Amount",
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal,
                                      fontSize: 20.0),
                                  hintText: 'Emi Amount',
                                  hintStyle: TextStyle(color: Colors.blueGrey),
                                  errorStyle: TextStyle(
                                      color: Colors.redAccent, fontSize: 10.0),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                            ),
                            SizedBox(height: 20.0),
                            Container(
                                height: 40.0,
                                child: MaterialButton(
                                    color: Colors.teal,
                                    child: Text(
                                      "Add",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    onPressed: () {
                                      if (_formkey3.currentState.validate()) {}
                                    })),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      )
                    ]))));
  }

  _pickDate() async {
    DateTime date = await showDatePicker(
        context: context,
        initialDate: pickedDate,
        firstDate: DateTime(DateTime.now().year - 10),
        lastDate: DateTime(DateTime.now().year + 50));
    if (date != null) {
      setState(() {
        pickedDate = date;
      });
    }
  }
}
