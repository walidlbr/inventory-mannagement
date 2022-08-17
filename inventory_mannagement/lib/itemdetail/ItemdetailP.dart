import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:inventory_mannagement/Itemclass.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ItemdetailP extends StatefulWidget {
  const ItemdetailP({Key? key}) : super(key: key);
  @override
  State<ItemdetailP> createState() => _ItemdetailPState();
}

class _ItemdetailPState extends State<ItemdetailP> {
  final TextEditingController qntController = TextEditingController();

  final Stream<QuerySnapshot> temp =
      FirebaseFirestore.instance.collection('temp').snapshots();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    AsyncSnapshot<QuerySnapshot> snapshot;
    return Container(
      child: Stack(
        children: [
          Container(
            color: HexColor('#1E1E37'),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                Container(
                  width: screenSize.width,
                  height: 30,
                  color: Colors.red,
                  margin: EdgeInsets.only(top: 30),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  width: screenSize.width * 0.7,
                  color: Colors.green,
                  height: screenSize.height * 0.32,
                ),
                Container(
                  width: screenSize.width * 0.7,
                  height: 30,
                  margin: EdgeInsets.only(top: 10),
                  child: StreamBuilder<QuerySnapshot>(
                    stream: temp,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        print('errorInData');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        print('downloading data...');
                      }
                      final data = snapshot.requireData;
                      return Text(
                        '${data.docs[0]['itemnom']}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            fontFamily: 'Poppins',
                            color: Colors.white),
                      );
                    },
                  ),
                ),
                Container(
                  width: screenSize.width * 0.7,
                  child: Text(
                    'Colors',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        fontFamily: 'Poppins',
                        color: Colors.white),
                  ),
                ),
                Container(
                  width: screenSize.width * 0.7,
                  margin: EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      Container(
                          height: 25,
                          width: 25,
                          margin: EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              color: HexColor("#25404B"))),
                      Container(
                          height: 25,
                          width: 25,
                          margin: EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              color: HexColor("#FFFFFF"))),
                      Container(
                          height: 25,
                          width: 25,
                          margin: EdgeInsets.only(right: 5),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              color: HexColor("#000000"))),
                      Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              color: HexColor("#3516Ff"))),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: screenSize.width * 0.7,
                  child: Text(
                    'Quantité',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  width: screenSize.width * 0.7,
                  height: 20,
                  child: Container(
                    margin: EdgeInsets.only(left: 3),
                    child: TextFormField(
                      controller: qntController,
                      onSaved: (value) {
                        qntController.text = value!;
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
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.white),
                ),
                Container(
                  padding: EdgeInsets.only(top: 2),
                  margin: EdgeInsets.only(top: 40),
                  width: screenSize.width * 0.5,
                  child: Center(
                    child: Text(
                      "Add To Cart",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 10),
                    ),
                  ),
                  height: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: HexColor('5592EE')),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  width: screenSize.width * 0.5,
                  height: 20,
                  child: Center(
                    child: Text(
                      "Track",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: HexColor("#FFFFFF").withOpacity(0.5),
                          fontSize: 10),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: HexColor('#55536B')),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
