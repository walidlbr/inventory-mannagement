import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:inventory_mannagement/Itemclass.dart';

class ItemlistP extends StatefulWidget {
  const ItemlistP({Key? key}) : super(key: key);

  @override
  State<ItemlistP> createState() => _ItemlistPState();
}

class _ItemlistPState extends State<ItemlistP> {
  final Stream<QuerySnapshot> x =
      FirebaseFirestore.instance.collection('collections').snapshots();
  late String mytemp;
  fetch() async {
    final fb = await FirebaseFirestore.instance
        .collection('temp')
        .doc('0')
        .get()
        .then((ds) => mytemp = ds['itemnom']);
    print(mytemp);
  }

  //Stream<DocumentSnapshot> getData()async*{
  //FirebaseFirestore.instance.collection('temp').where("userId", isEqualTo: ).snapshots();

  final Stream<QuerySnapshot> clc =
      FirebaseFirestore.instance.collection('collections').snapshots();
  @override
  Widget build(BuildContext context) {
    final fb = FirebaseFirestore.instance
        .collection('temp')
        .doc('0')
        .get()
        .then((ds) => mytemp = ds['itemnom']);
    var screenSize = MediaQuery.of(context).size;
    return Container(
      child: Stack(children: [
        Container(
          color: HexColor('#1E1E37'),
        ),
        Container(
          margin: EdgeInsets.only(
              top: screenSize.height * 0.073, left: screenSize.width * 0.1),
          child: Column(
            children: [
              Container(
                  width: screenSize.width * 1,
                  margin: EdgeInsets.only(
                      right: screenSize.width * 0.1,
                      top: screenSize.height * 0.085),
                  height: screenSize.height * 0.7,
                  child: StreamBuilder<QuerySnapshot>(
                      stream: x,
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          print('errorInData');
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          print('downloading data...');
                        }
                        final data1 = snapshot.requireData;
                        return ListView.builder(
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 40,
                                padding: EdgeInsets.only(right: 5, left: 5),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color:
                                        HexColor('#FFFFFF').withOpacity(0.25),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    )),
                                margin: EdgeInsets.only(bottom: 7),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(left: 5),
                                        child: Text(
                                          'ji',
                                          style: TextStyle(
                                              color: HexColor('#FFFFFF')
                                                  .withOpacity(0.75),
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      child: Text(
                                        'Toyota',
                                        style: TextStyle(
                                          fontSize: 9,
                                          color: HexColor('#FFFFFF')
                                              .withOpacity(0.75),
                                        ),
                                      ),
                                    ),
                                    Container(
                                        margin:
                                            EdgeInsets.only(top: 4, right: 3),
                                        child: Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(right: 2),
                                              child: Text(
                                                '200',
                                                style: TextStyle(
                                                  fontSize: 9,
                                                  fontWeight: FontWeight.w600,
                                                  color: HexColor('#FFFFFF')
                                                      .withOpacity(0.75),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 2),
                                              child: Text(
                                                'Dollar',
                                                style: TextStyle(
                                                  fontSize: 7,
                                                  fontWeight: FontWeight.w600,
                                                  color: HexColor('#FFFFFF')
                                                      .withOpacity(0.75),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              );
                            });
                      })),
            ],
          ),
        )
      ]),
    );
  }
}
