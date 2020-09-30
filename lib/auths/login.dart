import 'package:emi_tracker/dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'forgotpassword.dart';

class MyhomePage extends StatefulWidget {
  @override
  _MyhomePageState createState() => _MyhomePageState();
}

class _MyhomePageState extends State<MyhomePage> {
  TextEditingController _emailController;
  TextEditingController _passController;
  var _formkey = GlobalKey<FormState>();
  bool toHide = true;

  @override
  void initState() {
    super.initState();
    this._emailController = TextEditingController();
    this._passController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _login() async {
    try {
      await Firebase.initializeApp();

      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection("Users")
          .where('userName', isEqualTo: _emailController.text)
          .where('password', isEqualTo: _passController.text)
          .get();

      if (snapshot.docs.length > 0) {
        final session = await SharedPreferences.getInstance();
        session.setInt('shopId', int.parse(snapshot.docs[0].id));
        session.setInt(
            'userId', int.parse(snapshot.docs[0].data()['shopId'].id));

        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => Dashbaord()));
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  title: Text("Wrong Credentials"),
                  content: Text("Please enter valid Email/Password."),
                  actions: <Widget>[
                    FlatButton(
                        child: Text("Close"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                  ]);
            });
      }
    } catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text("Network Issue"),
                content: Text("Try Again or Contact Administrator."),
                actions: <Widget>[
                  FlatButton(
                      child: Text("Close"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ]);
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Form(
            key: _formkey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 175.0, 0.0, 0.0),
                      child: Text(
                        "EMI-Tracker",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50.0,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(285.0, 150.0, 0.0, 0.0),
                      child: Text(
                        ".",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 80.0,
                          color: Colors.teal,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 55.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: this._emailController,
                        validator: (val) =>
                            val.length < 1 ? 'Enter Email' : null,
                        decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                                fontSize: 30.0),
                            hintText: "Enter Email",
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
                        obscureText: toHide,
                        controller: this._passController,
                        validator: (val) =>
                            val.length < 1 ? 'Enter Password' : null,
                        decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: toHide
                                    ? Icon(Icons.visibility_off)
                                    : Icon(Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    toHide = !toHide;
                                  });
                                }),
                            labelText: "Password",
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                                fontSize: 30.0),
                            hintText: 'Enter your Password',
                            hintStyle: TextStyle(color: Colors.blueGrey),
                            errorStyle: TextStyle(
                                color: Colors.redAccent, fontSize: 15.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        alignment: Alignment(1.0, 0.0),
                        child: InkWell(
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgotPassword(),
                                ));
                          },
                        ),
                      ),
                      SizedBox(height: 50.0),
                      Container(
                          height: 50.0,
                          child: MaterialButton(
                              color: Colors.teal,
                              child: Text(
                                "LOGIN",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              onPressed: () {
                                if (_formkey.currentState.validate()) {
                                  _login();
                                }
                              })),
                    ],
                  ),
                ),
              )
            ])));
  }
}
