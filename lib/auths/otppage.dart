import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'changepassword.dart';

class OtpPage extends StatefulWidget {
  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  TextEditingController otpcontroller;
  var _formkeyotp = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    otpcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Form(
      key: _formkeyotp,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20.0, 350.0, 10.0, 0.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                WhitelistingTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(5)
              ],
              controller: otpcontroller,
              validator: (val) => val.isEmpty ? 'Text is Empty' : null,
              decoration: InputDecoration(
                  labelText: "OTP",
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                      fontSize: 20.0),
                  errorStyle:
                      TextStyle(color: Colors.redAccent, fontSize: 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ),
          ),
          SizedBox(height: 50.0),
          Container(
              height: 50.0,
              child: MaterialButton(
                  color: Colors.teal,
                  child: Text(
                    "Confirm",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  onPressed: () {
                    setState(() {
                      if (_formkeyotp.currentState.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChangePassword()));
                      }
                    });
                  })),
        ],
      ),
    )));
  }
}
