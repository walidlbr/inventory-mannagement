import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:inventory_mannagement/Itemclass.dart';
import 'package:inventory_mannagement/categories/Itemlist.dart';
import 'package:inventory_mannagement/itemdetail/ItemdetailP.dart';
import 'package:inventory_mannagement/profile/ProfileP.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CategoriesP extends StatefulWidget {
  const CategoriesP({Key? key}) : super(key: key);

  @override
  State<CategoriesP> createState() => _CategoriesPState();
}

class _CategoriesPState extends State<CategoriesP> {
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('comptes').snapshots();

  final Stream<QuerySnapshot> users1 =
      FirebaseFirestore.instance.collection('collections').snapshots();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    String x1 = 'pic.png';
    return Container(
      child: Stack(children: [
        Container(
          color: HexColor('#1E1E37'),
        ),
        Container(
          margin: EdgeInsets.only(top: screenSize.height * 0.08),
          height: screenSize.height * 1,
          width: double.infinity,
          child: Column(children: [
            Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Scaffold(
                                      body: ProfileP(),
                                    )));
                      },
                      child: Container(
                          margin: const EdgeInsets.only(left: 20),
                          width: 30,
                          height: 30,
                          child: Icon(
                            Icons.person,
                            color: HexColor('#1E1E37'),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                  const Radius.circular(100)),
                              color: HexColor("#7C7A91").withOpacity(0.5))),
                    ),
                    Container(
                      width: 100,
                    )
                  ],
                )),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: screenSize.width * 0.08, top: 10),
              child: const Text(
                'Hello User!',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            Container(
              width: screenSize.width,
              height: 20,
              margin: EdgeInsets.only(
                  top: 10,
                  left: screenSize.width * 0.08,
                  right: screenSize.width * 0.08),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white),
            ),
            Container(
              width: screenSize.width,
              height: 30,
              margin: EdgeInsets.only(
                  top: 10,
                  left: screenSize.width * 0.08,
                  right: screenSize.width * 0.08),
              child: Row(
                children: [
                  Container(
                    child: const Center(
                        child: const Text(
                      "Offers",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    )),
                    margin: EdgeInsets.only(
                      left: screenSize.width * 0.02,
                    ),
                    height: 27,
                    width: screenSize.width * 0.36,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.blue),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: screenSize.width * 0.02,
                    ),
                    child: Center(
                      child: Text(
                        "all",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: HexColor("#FFFFFF").withOpacity(0.5)),
                      ),
                    ),
                    height: 27,
                    width: screenSize.width * 0.19,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: HexColor("#7C7A91").withOpacity(0.58)),
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        "new",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: HexColor("#FFFFFF").withOpacity(0.5)),
                      ),
                    ),
                    margin: EdgeInsets.only(
                      left: screenSize.width * 0.02,
                    ),
                    height: 27,
                    width: screenSize.width * 0.21,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: HexColor("#7C7A91").withOpacity(0.58)),
                  )
                ],
              ),
            ),
            Container(
              width: screenSize.width,
              height: screenSize.height * 0.5604,
              margin: EdgeInsets.only(
                  top: 10,
                  left: screenSize.width * 0.08,
                  right: screenSize.width * 0.08),
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
                  return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200),
                      itemCount: data.size,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              child: GestureDetector(
                                onTap: () {
                                  final docuser = FirebaseFirestore.instance
                                      .collection('temp')
                                      .doc('0');
                                  docuser.set({
                                    'itemnom': '${data.docs[index].id}',
                                  });

                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) =>
                                              Scaffold(body: new ItemlistP())));
                                },
                                child: ClipRRect(
                                  child: Image.asset(
                                    x1,
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              margin: const EdgeInsets.all(5),
                              height: screenSize.height * 0.20,
                              width: screenSize.width * 0.6,
                            ),
                            Container(
                              width: screenSize.width * 0.32,
                              child: Text(
                                'hi',
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            )
                          ],
                        );
                      });
                },
              ),
            )
          ]),
        )
      ]),
    );
  }
}
