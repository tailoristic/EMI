import 'package:flutter/material.dart';
import 'otppage.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController forgotpassword;
  var _formkey4 = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    forgotpassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
      ),
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formkey4,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 250.0, 10.0, 0.0),
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: forgotpassword,
                        validator: (val) =>
                            !val.contains('@') ? 'Invalid Email' : null,
                        decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                              fontSize: 30.0),
                          hintText: "Enter Email id",
                          hintStyle: TextStyle(color: Colors.blueGrey),
                          errorStyle: TextStyle(
                              color: Colors.redAccent, fontSize: 15.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 50.0),
                      Container(
                        height: 50.0,
                        child: MaterialButton(
                          color: Colors.teal,
                          child: Text(
                            "Next",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          onPressed: () {
                            setState(
                              () {
                                if (_formkey4.currentState.validate()) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => OtpPage(),
                                    ),
                                  );
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
