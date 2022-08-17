import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class ProfileP extends StatefulWidget {
  const ProfileP({Key? key}) : super(key: key);

  @override
  State<ProfileP> createState() => _ProfilePState();
}

class _ProfilePState extends State<ProfileP> {
  File _pickedImage = File('text.txt');

  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('comptes').snapshots();

  final Stream<QuerySnapshot> users2 =
      FirebaseFirestore.instance.collection('itemcommander').snapshots();

  final Stream<QuerySnapshot> users1 =
      FirebaseFirestore.instance.collection('collections').snapshots();
  List<XFile>? _imageFileList;

  @override
  Widget build(BuildContext context) {
    int x = 0;
    VideoPlayerController? _controller;

    final ImagePicker _picker = ImagePicker();
    bool isVideo = false;
    String txt = 'item1';
    var screenSize = MediaQuery.of(context).size;

    return Container(
      child: Stack(children: [
        Container(
          color: HexColor('#1E1E37'),
        ),
        Container(
          height: screenSize.height,
          width: screenSize.width,
          child: Column(children: [
            Container(
              margin: EdgeInsets.only(top: screenSize.width * 0.126),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: screenSize.width * 0.1,
                      ),
                      child: Text(
                        "Back",
                        style: TextStyle(
                          color: HexColor("#FFFFFF").withOpacity(0.75),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 30, horizontal: 30),
                          child: CircleAvatar(
                            radius: 71,
                            backgroundColor: Colors.yellow,
                            child: CircleAvatar(
                              radius: 65,
                              backgroundColor: Colors.red,
                              backgroundImage: _pickedImage == null
                                  ? null
                                  : FileImage(_pickedImage),
                            ),
                          ),
                        ),
                        Positioned(
                            top: 120,
                            left: 110,
                            child: RawMaterialButton(
                              elevation: 10,
                              fillColor: Colors.yellow,
                              child: Icon(Icons.add_a_photo),
                              padding: EdgeInsets.all(15.0),
                              shape: CircleBorder(),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                          'Choose option',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.amber),
                                        ),
                                        content: SingleChildScrollView(
                                          child: ListBody(
                                            children: [
                                              InkWell(
                                                onTap: _pickImageCamera,
                                                splashColor:
                                                    Colors.purpleAccent,
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Icon(
                                                        Icons.camera,
                                                        color:
                                                            Colors.purpleAccent,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Camera',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.green),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              InkWell(
                                                onTap: _pickImageGallery,
                                                splashColor:
                                                    Colors.purpleAccent,
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Icon(
                                                        Icons.image,
                                                        color:
                                                            Colors.purpleAccent,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Gallery',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.green),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              InkWell(
                                                onTap: _remove,
                                                splashColor:
                                                    Colors.purpleAccent,
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Icon(
                                                        Icons.remove_circle,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Remove',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.red),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                            ))
                      ],
                    ),
                  ]),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 40,
              ),
              child: Text(
                'Hello,User',
                style: TextStyle(
                    color: HexColor("#FFFFFF").withOpacity(0.75),
                    fontWeight: FontWeight.bold),
              ),
            ),
            GestureDetector(
              onTap: _pickImageGallery,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                child: CircleAvatar(
                  radius: 71,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 65,
                    backgroundColor: Colors.amber,
                    backgroundImage:
                        _pickedImage == null ? null : FileImage(_pickedImage),
                  ),
                ),
              ),
            ),
            Container(
              height: screenSize.height * 0.125,
              width: screenSize.width * 0.8,
              margin: EdgeInsets.only(top: 30),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                              "Products",
                              style: TextStyle(
                                  color: HexColor("#FFFFFF").withOpacity(0.5),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 7),
                            child: Text(
                              '15',
                              style: TextStyle(
                                color: HexColor("#FFFFFF").withOpacity(0.75),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                              "Purchase",
                              style: TextStyle(
                                  color: HexColor("#FFFFFF").withOpacity(0.5),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 7),
                            child: Text(
                              '196',
                              style: TextStyle(
                                  color: HexColor("#FFFFFF").withOpacity(0.75),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                              "Budget",
                              style: TextStyle(
                                  color: HexColor("#FFFFFF").withOpacity(0.5),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 7),
                            child: Text(
                              '125',
                              style: TextStyle(
                                  color: HexColor("#FFFFFF").withOpacity(0.75),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
            ),
            Container(
                width: screenSize.width * 0.73,
                height: screenSize.height * 0.35,
                child: StreamBuilder<QuerySnapshot>(
                    stream: users,
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
                            txt = 'item' + '${index}';
                            return Container(
                              height: 34,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                                color: HexColor('#7C7A91').withOpacity(0.58),
                              ),
                              margin: EdgeInsets.only(top: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 12),
                                    child: Text(
                                      '${data.docs[0][txt]}',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: HexColor('#FFFFFF')
                                            .withOpacity(0.6),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      '${data.docs[0]['date' + '${index}']}',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: HexColor('#FFFFFF')
                                            .withOpacity(0.6),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(right: 12),
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.verified,
                                            size: 13,
                                            color: Color.fromARGB(
                                                177, 76, 175, 79),
                                          ),
                                          Icon(
                                            Icons.delete_forever,
                                            size: 15,
                                            color: Color.fromARGB(
                                                208, 182, 63, 55),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          });
                    })),
          ]),
        )
      ]),
    );
  }

  void _remove() {
    setState(() {
      _pickedImage;
    });
    Navigator.pop(context);
  }

  void _pickImageCamera() async {
    final picker = ImagePicker();
    final pickedImage =
        await picker.getImage(source: ImageSource.camera, imageQuality: 10);
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _pickedImage = pickedImageFile;
    });
    Navigator.pop(context);
  }

  void _pickImageGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _pickedImage = pickedImageFile;
    });
    Navigator.pop(context);
  }
}
