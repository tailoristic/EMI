import 'package:flutter/material.dart';
import "login.dart";

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController changepassword;
  var _formkeychange = GlobalKey<FormState>();
  bool _chgpsswrd = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    changepassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Password"),
      ),
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Form(
          key: _formkeychange,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 200.0, 10.0, 0.0),
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      obscureText: _chgpsswrd,
                      controller: changepassword,
                      validator: (val) =>
                          val.length < 4 ? 'Password too Short' : null,
                      decoration: InputDecoration(
                          labelText: "Enter New Password",
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                              fontSize: 30.0),
                          hintText: 'Enter New Password',
                          hintStyle: TextStyle(color: Colors.blueGrey),
                          errorStyle: TextStyle(
                              color: Colors.redAccent, fontSize: 15.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                    SizedBox(
                      width: 50.0,
                      height: 20.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      obscureText: _chgpsswrd,
                      controller: changepassword,
                      validator: (val) =>
                          val.length < 4 ? 'Password too Short' : null,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              icon: _chgpsswrd
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _chgpsswrd = !_chgpsswrd;
                                });
                              }),
                          labelText: "Confirm Your Password",
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                              fontSize: 30.0),
                          hintText: 'Confirm Your Password',
                          hintStyle: TextStyle(color: Colors.blueGrey),
                          errorStyle: TextStyle(
                              color: Colors.redAccent, fontSize: 15.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                    SizedBox(height: 50.0),
                    Container(
                        height: 50.0,
                        child: MaterialButton(
                            color: Colors.teal,
                            child: Text(
                              "Save",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            onPressed: () {
                              setState(() {
                                if (_formkeychange.currentState.validate()) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyhomePage()));
                                }
                              });
                            })),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
