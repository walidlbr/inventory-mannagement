import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HangardP extends StatefulWidget {
  const HangardP({Key? key}) : super(key: key);

  @override
  State<HangardP> createState() => _HangardPState();
}

class _HangardPState extends State<HangardP> {
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
                      'Hangard',
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
                                    BorderRadius.all(Radius.circular(10)),
                                color: Colors.red),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 12, bottom: 8),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "Recent added",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Poppins",
                                    color: HexColor('#FFFFFF').withOpacity(1)),
                              ),
                            ),
                          ),
                        ],
                      )),
                      height: 80,
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
