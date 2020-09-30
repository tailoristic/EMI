import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SalesDetails extends StatefulWidget {
  @override
  _SalesDetailsState createState() => _SalesDetailsState();
}

class _SalesDetailsState extends State<SalesDetails> {
  var _custid = ['cust_id'];
  var _currentItemSelected = 'cust_id';
  DateTime pickedDate;
  TimeOfDay time;

  TextEditingController salesdetailsController;
  var _formkey2 = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    time = TimeOfDay.now();
  }

  @override
  void dispose() {
    salesdetailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sales Details'),
        ),
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
            child: Form(
                key: _formkey2,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
                        child: Column(
                          children: [
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
                            ListTile(
                              title: DropdownButton<String>(
                                  items:
                                      _custid.map((String dropDownStringItem) {
                                    return DropdownMenuItem<String>(
                                      value: dropDownStringItem,
                                      child: Text(dropDownStringItem),
                                    );
                                  }).toList(),
                                  value: _currentItemSelected,
                                  onChanged: (String valueSelected) {
                                    _ondropDownItemSelected(valueSelected);
                                  }),
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
                                LengthLimitingTextInputFormatter(20)
                              ],
                              controller: salesdetailsController,
                              validator: (val) =>
                                  val.isEmpty ? 'TextField is Empty' : null,
                              decoration: InputDecoration(
                                  labelText: "AccountNo",
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal,
                                      fontSize: 20.0),
                                  hintText: 'AccountNo',
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
                                LengthLimitingTextInputFormatter(10)
                              ],
                              controller: salesdetailsController,
                              validator: (val) =>
                                  val.isEmpty ? 'TextField is Empty' : null,
                              decoration: InputDecoration(
                                  labelText: "Price",
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal,
                                      fontSize: 20.0),
                                  hintText: 'Price',
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
                                LengthLimitingTextInputFormatter(10)
                              ],
                              controller: salesdetailsController,
                              decoration: InputDecoration(
                                  labelText: "File Charge",
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal,
                                      fontSize: 20.0),
                                  hintText: 'File Charge',
                                  hintStyle: TextStyle(color: Colors.blueGrey),
                                  errorStyle: TextStyle(
                                      color: Colors.redAccent, fontSize: 15.0),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                            ),
                            SizedBox(
                              width: 10.0,
                              height: 20.0,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                WhitelistingTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(10)
                              ],
                              controller: salesdetailsController,
                              validator: (val) =>
                                  val.isEmpty ? 'Text is Empty' : null,
                              decoration: InputDecoration(
                                  labelText: "Emi_Months",
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal,
                                      fontSize: 20.0),
                                  hintText: "Emi Months",
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
                              controller: salesdetailsController,
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
                            SizedBox(
                              width: 50.0,
                              height: 10.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: salesdetailsController,
                              validator: (val) =>
                                  val.isEmpty ? 'TextField is Empty' : null,
                              decoration: InputDecoration(
                                  labelText: "Down Payment",
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal,
                                      fontSize: 20.0),
                                  hintText: 'Down Payment',
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
                              controller: salesdetailsController,
                              validator: (val) =>
                                  val.isEmpty ? 'TextField is Empty' : null,
                              decoration: InputDecoration(
                                  labelText: "Emi_Interest",
                                  labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal,
                                      fontSize: 20.0),
                                  hintText: 'Emi Interest',
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
                            ListTile(
                              title: Text(
                                  'Emi_Date: ${pickedDate.day}/${pickedDate.month}/${pickedDate.year}',
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
                            SizedBox(height: 20.0),
                            ListTile(
                              title: Text(
                                  'Emi_Time: ${time.hour} : ${time.minute}',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal)),
                              leading: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.teal,
                              ),
                              onTap: _pickTime,
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
                                      if (_formkey2.currentState.validate()) {}
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

  _pickTime() async {
    TimeOfDay t = await showTimePicker(context: context, initialTime: time);
    if (t != null) {
      time = t;
    }
  }

  void _ondropDownItemSelected(String valueSelected) {
    setState(() {
      this._currentItemSelected = valueSelected;
    });
  }
}
