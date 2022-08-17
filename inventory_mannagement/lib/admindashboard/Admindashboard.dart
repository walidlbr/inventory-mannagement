import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Admindashboard extends StatefulWidget {
  const Admindashboard({Key? key}) : super(key: key);

  @override
  State<Admindashboard> createState() => _AdmindashboardState();
}

class _AdmindashboardState extends State<Admindashboard> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: [
          Container(
            color: HexColor('#1E1E37'),
          ),
          Container(
            margin: EdgeInsets.only(
                top: screenSize.height * 0.073, left: screenSize.width * 0.1),
            child: Column(
              children: [
                Container(
                  width: screenSize.width * 0.8,
                  height: 40,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Dashboard",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: HexColor("#6699C6")),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: screenSize.height * 0.043),
                  width: screenSize.width * 0.8,
                  height: screenSize.height * 0.715,
                  child: ListView.builder(itemBuilder: (context, index) {
                    return Container(
                      child: Container(
                          child: Stack(
                        children: [
                          Container(
                            height: double.infinity,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                                color: HexColor("#FFFFFF").withOpacity(0.2)),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Item1",
                                  style: TextStyle(
                                    color: HexColor("FFFFFF").withOpacity(0.6),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  child: Text(
                                    "14-03-2022",
                                    style: TextStyle(
                                        color:
                                            HexColor("FFFFFF").withOpacity(0.6),
                                        fontSize: 8,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  child: Text(
                                    "2456",
                                    style: TextStyle(
                                        color:
                                            HexColor("FFFFFF").withOpacity(0.6),
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(
                                  "sd kd",
                                  style: TextStyle(
                                      color:
                                          HexColor("FFFFFF").withOpacity(0.6),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )
                        ],
                      )),
                      height: 35,
                      margin: EdgeInsets.only(bottom: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
