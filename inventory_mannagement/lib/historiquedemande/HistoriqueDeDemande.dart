import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HistoriqueDeDemande extends StatefulWidget {
  const HistoriqueDeDemande({Key? key}) : super(key: key);

  @override
  State<HistoriqueDeDemande> createState() => _HistoriqueDeDemandeState();
}

class _HistoriqueDeDemandeState extends State<HistoriqueDeDemande> {
  final Stream<QuerySnapshot> users1 =
      FirebaseFirestore.instance.collection('0663235296').snapshots();
  final Stream<QuerySnapshot> users2 =
      FirebaseFirestore.instance.collection('0663235296v').snapshots();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    String txt = 'item1';

    String txt1 = 'itemvalide1';
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
                width: double.infinity,
                child: Text(
                  'Historique de demande',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: HexColor("#6699C6")),
                ),
              ),
              Container(
                width: screenSize.width * 1,
                margin: EdgeInsets.only(
                    right: screenSize.width * 0.1,
                    top: screenSize.height * 0.03,
                    bottom: screenSize.height * 0.03),
                height: screenSize.height * 0.37,
                child: StreamBuilder<QuerySnapshot>(
                  stream: users1,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      print('errorInData');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      print('downloading data...');
                    }
                    final data = snapshot.requireData;
                    return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: data.size,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 40,
                            padding: EdgeInsets.only(right: 5, left: 5),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: HexColor('#FFFFFF').withOpacity(0.25),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                )),
                            margin: EdgeInsets.only(bottom: 7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 12),
                                  child: Text(
                                    '${data.docs[index]['item']}',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color:
                                          HexColor('#FFFFFF').withOpacity(0.6),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    '${data.docs[index]['itemdate']}',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color:
                                          HexColor('#FFFFFF').withOpacity(0.6),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 12),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: () async {
                                            FirebaseFirestore.instance
                                                .collection('0663235296')
                                                .doc(snapshot
                                                    .data?.docs[index].id)
                                                .delete();
                                          },
                                          icon: Icon(Icons.delete_forever),
                                          iconSize: 15,
                                          color:
                                              Color.fromARGB(208, 182, 63, 55),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                ),
              ),
              Container(
                width: screenSize.width * 1,
                margin: EdgeInsets.only(
                  right: screenSize.width * 0.1,
                ),
                height: screenSize.height * 0.39,
                child: StreamBuilder<QuerySnapshot>(
                  stream: users2,
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      print('errorInData');
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      print('downloading data...');
                    }
                    final data1 = snapshot.requireData;
                    return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: data1.size,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 40,
                            padding: EdgeInsets.only(right: 5, left: 5),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: HexColor('#FFFFFF').withOpacity(0.25),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                )),
                            margin: EdgeInsets.only(bottom: 7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 12),
                                  child: Text(
                                    '${data1.docs[index]['itemv']}',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color:
                                          HexColor('#FFFFFF').withOpacity(0.6),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    '${data1.docs[index]['datev']}',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color:
                                          HexColor('#FFFFFF').withOpacity(0.6),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 12),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: () async {},
                                          icon: Icon(Icons.verified),
                                          iconSize: 15,
                                          color:
                                              Color.fromARGB(177, 76, 175, 79),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
