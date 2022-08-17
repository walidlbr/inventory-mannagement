import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:inventory_mannagement/signin/SignInP.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterP extends StatefulWidget {
  const RegisterP({Key? key}) : super(key: key);

  @override
  _RegisterPState createState() => _RegisterPState();
}

class _RegisterPState extends State<RegisterP> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController usernicknameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController password2Controller = TextEditingController();
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
                  top: screenSize.height * 0.1, left: screenSize.width * 0.1),
              child: Form(
                key: _formkey,
                child: Container(
                  width: screenSize.width * 0.8,
                  height: screenSize.height,
                  child: Column(children: [
                    Container(
                        child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          'Please Fill the form to create an account',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              color: HexColor('#FFFFFF').withOpacity(0.6)),
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Column(children: [
                        Align(
                            alignment: Alignment(-0.90, 0.0),
                            child: Text('UserName :',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color:
                                        HexColor('#FFFFFF').withOpacity(0.6)))),
                        Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            margin: EdgeInsets.only(top: 5),
                            decoration: BoxDecoration(
                                color: HexColor('#C4C4C4').withOpacity(0.25),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: TextFormField(
                              controller: usernameController,
                              onSaved: (value) {
                                usernameController.text = value!;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your username';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.name,
                            ))
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Column(children: [
                        Align(
                            alignment: Alignment(-0.90, 0.0),
                            child: Text('UserNickName :',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color:
                                        HexColor('#FFFFFF').withOpacity(0.6)))),
                        Container(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            margin: EdgeInsets.only(top: 5),
                            decoration: BoxDecoration(
                                color: HexColor('#C4C4C4').withOpacity(0.25),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: TextFormField(
                              controller: usernicknameController,
                              onSaved: (value) {
                                usernameController.text = value!;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your username';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.name,
                            ))
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Column(children: [
                        Align(
                            alignment: Alignment(-0.90, 0.0),
                            child: Text('Email:',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color:
                                        HexColor('#FFFFFF').withOpacity(0.6)))),
                        Container(
                            margin: EdgeInsets.only(top: 5),
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                                color: HexColor('#C4C4C4').withOpacity(0.25),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: TextFormField(
                              controller: emailController,
                              onSaved: (value) {
                                emailController.text = value!;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ))
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Column(children: [
                        Align(
                            alignment: Alignment(-0.90, 0.0),
                            child: Text('Password:',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color:
                                        HexColor('#FFFFFF').withOpacity(0.6)))),
                        Container(
                            margin: EdgeInsets.only(top: 5),
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                                color: HexColor('#C4C4C4').withOpacity(0.25),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: TextFormField(
                              controller: passwordController,
                              onSaved: (value) {
                                passwordController.text = value!;
                              },
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length < 6) {
                                  return 'Please enter a valid password';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.visiblePassword,
                            ))
                      ]),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Column(children: [
                        Align(
                            alignment: Alignment(-0.85, 0.0),
                            child: Text('Confirm Your Password:',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color:
                                        HexColor('#FFFFFF').withOpacity(0.6)))),
                        Container(
                            margin: EdgeInsets.only(top: 5),
                            padding: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                                color: HexColor('#C4C4C4').withOpacity(0.25),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: TextFormField(
                              controller: password2Controller,
                              onSaved: (value) {
                                password2Controller.text = value!;
                              },
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value != passwordController.text) {
                                  return 'verify your password please';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.visiblePassword,
                            ))
                      ]),
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
                            onPressed: () {
                              final username = usernameController.text;
                              final usernickname = usernicknameController.text;
                              final useremail = emailController.text;
                              final userpassword = passwordController.text;
                              createUser(
                                  nom: username,
                                  prenom: usernickname,
                                  email: useremail,
                                  motdepasse: userpassword);
                            },
                            child: Text('Register',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )))),
                    Container(
                        margin: EdgeInsets.only(
                          left: screenSize.width * 0.15,
                          top: 10,
                        ),
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                "I'am already a Member !",
                                style: TextStyle(
                                    color:
                                        HexColor('#FFFFFF').withOpacity(0.6)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignInP()),
                                    );
                                  },
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color:
                                          HexColor('#4AB3F9').withOpacity(0.6),
                                    ),
                                  )),
                            )
                          ],
                        )),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      height: 5,
                      width: 140,
                      color: HexColor('#4AB3F9').withOpacity(0.5),
                    )
                  ]),
                ),
              ),
            )
          ],
        )));
  }

  Future createUser(
      {required String nom,
      required String prenom,
      required String email,
      required String motdepasse}) async {
    final docUser =
        FirebaseFirestore.instance.collection('comptes').doc(idGenerator());

    final json = {
      'nom': nom,
      'prenom': prenom,
      'email': email,
      'mot de passe': motdepasse,
    };
    await docUser.set(json);
  }

  String idGenerator() {
    final now = DateTime.now();
    return now.microsecondsSinceEpoch.toString();
  }
}
