import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:inventory_mannagement/categories/CategoriesP.dart';
import 'package:inventory_mannagement/register/RegisterP.dart';

import 'package:inventory_mannagement/signin/Userr.dart';

class AdminSigninP extends StatefulWidget {
  const AdminSigninP({Key? key}) : super(key: key);

  @override
  _AdminSigninPState createState() => _AdminSigninPState();
}

class _AdminSigninPState extends State<AdminSigninP> {
  final _formKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  late String errorMessage;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
            body: Stack(
          children: [
            Container(
              color: HexColor('#1E1E37'),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: screenSize.width * 0.1, top: screenSize.height * 0.2),
              width: screenSize.width * 0.8,
              height: screenSize.height,
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    Container(
                        child: Text(
                      'Log In',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                          fontSize: 40,
                          fontWeight: FontWeight.w700),
                    )),
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          'Login as an admin',
                          style: TextStyle(
                              color: HexColor('#FFFFFF').withOpacity(0.5)),
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Column(children: [
                        Align(
                            alignment: Alignment(-0.90, 0.0),
                            child: Text(
                              'UserName or Mail:',
                              style: TextStyle(
                                  color: HexColor('#FFFFFF').withOpacity(0.5)),
                            )),
                        Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            margin: EdgeInsets.only(top: 5),
                            decoration: BoxDecoration(
                                color: HexColor('#C4C4C4').withOpacity(0.25),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: TextFormField(
                              controller: emailController,
                              onSaved: (value) {
                                emailController.text = value!;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your message';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    color: Color.fromARGB(255, 196, 196, 196)),
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ))
                      ]),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Column(children: [
                          Align(
                              alignment: Alignment(-0.9, 0.0),
                              child: Text(
                                'Password:',
                                style: TextStyle(
                                    color:
                                        HexColor('#FFFFFF').withOpacity(0.5)),
                              )),
                          Container(
                              padding: EdgeInsets.only(left: 10, right: 10),
                              margin: EdgeInsets.only(top: 5, bottom: 5),
                              decoration: BoxDecoration(
                                  color: HexColor('#C4C4C4').withOpacity(0.25),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5))),
                              child: TextFormField(
                                controller: passwordController,
                                onSaved: (value) {
                                  passwordController.text = value!;
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your message';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.visiblePassword,
                              ))
                        ])),
                    Align(
                      alignment: Alignment(0.9, 0),
                      child: Text(
                        'Forgot Password ?',
                        style: TextStyle(
                            fontSize: 14,
                            color: HexColor('#4AB3F9').withOpacity(0.6)),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 50),
                        height: 64,
                        width: 300,
                        decoration: BoxDecoration(
                            color: HexColor('#4AB3F9').withOpacity(0.6),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        child: TextButton(
                            onPressed: () {},
                            child: Text('Login',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 253, 253, 253),
                                  fontWeight: FontWeight.bold,
                                )))),
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      height: 5,
                      width: 140,
                      color: HexColor('#4AB3F9').withOpacity(0.5),
                    ),
                  ],
                ),
              ),
            )
          ],
        )));
  }
}
