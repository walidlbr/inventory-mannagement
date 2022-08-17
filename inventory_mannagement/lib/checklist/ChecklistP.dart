import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ChecklistP extends StatefulWidget {
  const ChecklistP({Key? key}) : super(key: key);

  @override
  State<ChecklistP> createState() => _ChecklistPState();
}

class _ChecklistPState extends State<ChecklistP> {
  @override
  Widget build(BuildContext context) {
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
                width: double.infinity,
                child: Text(
                  'Check List- Validation',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: HexColor("#6699C6")),
                ),
              ),
              Container(
                  width: screenSize.width * 1,
                  margin: EdgeInsets.only(
                      right: screenSize.width * 0.1,
                      top: screenSize.height * 0.065),
                  height: screenSize.height * 0.7,
                  child: ListView.builder(
                      itemCount: 5,
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
                                margin: EdgeInsets.only(left: 2),
                                child: Text(
                                  'ItemName',
                                  style: TextStyle(
                                      color:
                                          HexColor('#FFFFFF').withOpacity(0.75),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  '25-03-2022',
                                  style: TextStyle(
                                    fontSize: 6,
                                    color:
                                        HexColor('#FFFFFF').withOpacity(0.75),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 4),
                                child: Text(
                                  '200Dollar',
                                  style: TextStyle(
                                    fontSize: 7,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        HexColor('#FFFFFF').withOpacity(0.75),
                                  ),
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.verified,
                                      size: 13,
                                      color: Color.fromARGB(177, 76, 175, 79),
                                    ),
                                    Icon(
                                      Icons.delete_forever,
                                      size: 15,
                                      color: Color.fromARGB(208, 182, 63, 55),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      })),
            ],
          ),
        )
      ]),
    );
  }
}
