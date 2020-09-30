import 'dart:io';
import 'package:emi_tracker/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;

class Customers extends StatefulWidget {
  @override
  _CustomersState createState() => _CustomersState();
}

class _CustomersState extends State<Customers> {
  final databaseReference = FirebaseFirestore.instance;
  String cName;
  String cAdd;
  String cMob1;
  String cMob2;
  String gName;
  String gAdd;
  String gMob1;
  String gMob2;
  var _formkey = GlobalKey<FormState>();
  File _customerImg;
  File _garauntorImg;
  final picker = ImagePicker();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future getCustomerImg() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      _customerImg = File(pickedFile.path);
    });
  }

  Future getGurantorImg() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      _garauntorImg = File(pickedFile.path);
    });
  }

  Future uploadImageToFirebase(File file) async {
    if (await file.exists()) {
      String fileName = path.basename(file.path);
      StorageReference firebaseStorageRef =
          FirebaseStorage.instance.ref().child('uploads/$fileName');
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(file);
      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
      taskSnapshot.ref.getDownloadURL().then(
            (value) => print("Done: $value"),
          );
    }
  }

  _saveCustomer() async {
    await FirebaseFirestore.instance.collection('/books').add({
      'shopId': null,
      'pic': null,
      'name': this.cName,
      'address': this.cAdd,
      'mobNo1': this.cMob1,
      'mobNo2': this.cMob2,
      'gPic': null,
      'gName': this.gName,
      'gAddress': this.gAdd,
      'gMobNo1': this.gMob1,
      'gMobNo2': this.gMob2,
    }).then((value) {
      print("done");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Dashbaord(),
        ),
      );
    }).catchError((e) {
      print(e);
    });

    // await databaseReference.collection("books").doc("1").set({
    //   'shopId': session.getInt('shopId'),
    //   'pic': uploadImageToFirebase(_customerImg),
    //   'name': _cNameController.text,
    //   'address': _cAddController.text,
    //   'mobNo1': int.parse(_cMob1Controller.text),
    //   'mobNo2': int.parse(_cMob2Controller.text),
    //   'gPic': uploadImageToFirebase(_garauntorImg),
    //   'gName': _gNameController.text,
    //   'gAddress': _gAddController.text,
    //   'gMobNo1': int.parse(_gMob1Controller.text),
    // //   'gMobNo2': int.parse(_gMob1Controller.text),
    // // });
    // return FirebaseFirestore.instance.collection('/books').add({
    //   // 'shopId': 11,
    //   // 'pic': null,
    //   'name': _cNameController.text,
    //   'address': _cAddController.text,
    //   'mobNo1': int.parse(_cMob1Controller.text),
    //   // 'mobNo2': int.parse(_cMob2Controller.text),
    //   // 'gPic': null,
    //   // 'gName': _gNameController.text,
    //   // 'gAddress': _gAddController.text,
    //   // 'gMobNo1': int.parse(_gMob1Controller.text),
    //   // 'gMobNo2': int.parse(_gMob1Controller.text),
    // }).then((value) {
    //   Navigator.push(context,
    //       MaterialPageRoute(builder: (BuildContext context) => Customers()));
    // }).catchError((e) {
    //   print(e);
    // });

    // await databaseReference.collection("books").add({
    //   'shopId': session.getInt('shopId'),
    //   'pic': uploadImageToFirebase(_customerImg),
    //   'name': _cNameController.text,
    //   'address': _cAddController.text,
    //   'mobNo1': int.parse(_cMob1Controller.text),
    //   'mobNo2': int.parse(_cMob2Controller.text),
    //   'gPic': uploadImageToFirebase(_garauntorImg),
    //   'gName': _gNameController.text,
    //   'gAddress': _gAddController.text,
    //   'gMobNo1': int.parse(_gMob1Controller.text),
    //   'gMobNo2': int.parse(_gMob1Controller.text),
    // });

    //   Navigator.push(context,
    //       MaterialPageRoute(builder: (BuildContext context) => Customers()));
    // } catch (e) {
    //   showDialog(
    //       context: context,
    //       builder: (BuildContext context) {
    //         return AlertDialog(
    //             title: Text("Network Issue"),
    //             content: Text("Try Again or Contact Administrator."),
    //             actions: <Widget>[
    //               FlatButton(
    //                   child: Text("Close"),
    //                   onPressed: () {
    //                     Navigator.of(context).pop();
    //                   }),
    //             ]);
    //       });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Details'),
      ),
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.only(top: 20.0, left: 25.0, right: 20.0),
                  child: Center(
                    child: Text(
                      "Customer Detail",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  )),
              Container(
                padding: EdgeInsets.only(top: 20.0, left: 50.0, right: 50.0),
                child: Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                          radius: 80.0,
                          backgroundImage: _customerImg == null
                              ? AssetImage('assets/icon/profile.png')
                              : FileImage(File(_customerImg.path))),
                      Positioned(
                          bottom: 20.0,
                          right: 20.0,
                          child: InkWell(
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.blue,
                              size: 40.0,
                            ),
                            onTap: getCustomerImg,
                          ))
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 25.0, left: 20.0, right: 20.0),
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        setState(() {
                          this.cName = value;
                        });
                      },
                      validator: (val) => val.isEmpty ? 'Text is Empty' : null,
                      decoration: InputDecoration(
                          labelText: "Name",
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                              fontSize: 20.0),
                          hintText: "Name",
                          hintStyle: TextStyle(color: Colors.blueGrey),
                          errorStyle: TextStyle(
                              color: Colors.redAccent, fontSize: 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
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
                      onChanged: (value) {
                        setState(() {
                          this.cAdd = value;
                        });
                      },
                      validator: (val) =>
                          val.isEmpty ? 'TextField is Empty' : null,
                      decoration: InputDecoration(
                          labelText: "Address",
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                              fontSize: 20.0),
                          hintText: 'Address',
                          hintStyle: TextStyle(color: Colors.blueGrey),
                          errorStyle: TextStyle(
                              color: Colors.redAccent, fontSize: 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
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
                      onChanged: (value) {
                        setState(() {
                          this.cMob1 = value;
                        });
                      },
                      validator: (val) =>
                          val.isEmpty ? 'TextField is Empty' : null,
                      decoration: InputDecoration(
                          labelText: "Contact No 1",
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                              fontSize: 20.0),
                          hintText: 'Contact No 1',
                          hintStyle: TextStyle(color: Colors.blueGrey),
                          errorStyle: TextStyle(
                              color: Colors.redAccent, fontSize: 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
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
                      onChanged: (value) {
                        setState(() {
                          this.cMob2 = value;
                        });
                      },
                      decoration: InputDecoration(
                          labelText: "Contact No 2",
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                              fontSize: 20.0),
                          hintText: 'optional',
                          hintStyle: TextStyle(color: Colors.blueGrey),
                          errorStyle: TextStyle(
                              color: Colors.redAccent, fontSize: 15.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    ),
                    SizedBox(
                      height: 1.0,
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(top: 20.0, left: 1.0, right: 20.0),
                      child: Text(
                        "Guarantor Detail",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(top: 20.0, left: 50.0, right: 50.0),
                      child: Center(
                        child: Stack(
                          children: [
                            CircleAvatar(
                                radius: 80.0,
                                backgroundImage: _garauntorImg == null
                                    ? AssetImage('assets/icon/profile.png')
                                    : FileImage(File(_garauntorImg.path))),
                            Positioned(
                                bottom: 20.0,
                                right: 20.0,
                                child: InkWell(
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.blue,
                                    size: 40.0,
                                  ),
                                  onTap: getGurantorImg,
                                ))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                      height: 20.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        setState(() {
                          this.gName = value;
                        });
                      },
                      validator: (val) => val.isEmpty ? 'Text is Empty' : null,
                      decoration: InputDecoration(
                          labelText: "Name",
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                              fontSize: 20.0),
                          hintText: "Name",
                          hintStyle: TextStyle(color: Colors.blueGrey),
                          errorStyle: TextStyle(
                              color: Colors.redAccent, fontSize: 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
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
                      onChanged: (value) {
                        setState(() {
                          this.gAdd = value;
                        });
                      },
                      validator: (val) =>
                          val.isEmpty ? 'TextField is Empty' : null,
                      decoration: InputDecoration(
                          labelText: "Address",
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                              fontSize: 20.0),
                          hintText: 'Address',
                          hintStyle: TextStyle(color: Colors.blueGrey),
                          errorStyle: TextStyle(
                              color: Colors.redAccent, fontSize: 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
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
                      onChanged: (value) {
                        setState(() {
                          this.gMob1 = value;
                        });
                      },
                      validator: (val) =>
                          val.isEmpty ? 'TextField is Empty' : null,
                      decoration: InputDecoration(
                        labelText: "Contact No 1",
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                            fontSize: 20.0),
                        hintText: 'Contact No 1',
                        hintStyle: TextStyle(color: Colors.blueGrey),
                        errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
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
                      onChanged: (value) {
                        setState(() {
                          this.gMob2 = value;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: "Contact No 2",
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                            fontSize: 20.0),
                        hintText: 'optional',
                        hintStyle: TextStyle(color: Colors.blueGrey),
                        errorStyle:
                            TextStyle(color: Colors.redAccent, fontSize: 15.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
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
                          if (_formkey.currentState.validate()) {
                            _saveCustomer();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
