import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:inventory_mannagement/admindashboard/Admindashboard.dart';
import 'package:inventory_mannagement/categories/CategoriesP.dart';
import 'package:inventory_mannagement/checklist/ChecklistP.dart';
import 'package:inventory_mannagement/hangard/HangardP.dart';
import 'package:inventory_mannagement/historiquedemande/HistoriqueDeDemande.dart';
import 'package:inventory_mannagement/itemdetail/ItemdetailP.dart';
import 'package:inventory_mannagement/categories/Itemlist.dart';
import 'package:inventory_mannagement/profile/ProfileP.dart';
import 'package:inventory_mannagement/register/RegisterP.dart';
import 'package:inventory_mannagement/signin/SignInP.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:inventory_mannagement/db.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initilizaeDb();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCnNbCQ0PZ9Mje9Fs6blUttmtVUldkFUgE",
      appId: "1:797117309005:android:28498c07354978e8453c04",
      projectId: "employeer-mannagement",
      messagingSenderId: '797117309005',
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late int activeIndex;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    activeIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
        child: IndexedStack(
          index: activeIndex,
          children: const [
            ItemlistP(),
            HistoriqueDeDemande(),
            CategoriesP(),
            ProfileP()
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: HexColor('#1E1E37'),
        child: Container(
          padding: EdgeInsets.only(),
          decoration: BoxDecoration(
              color: Color.fromARGB(40, 0, 0, 0),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12))),
          child: GNav(
              onTabChange: (index) {
                setState(() {
                  activeIndex = index;
                });
              },
              selectedIndex: activeIndex,
              textSize: 10,
              rippleColor: Colors.grey, // tab button ripple color when pressed
              hoverColor:
                  Color.fromARGB(96, 158, 158, 158), // tab button hover color
              haptic: true, // haptic feedback
              tabBorderRadius: 15,
              tabActiveBorder: Border.all(
                  color: Colors.black, width: 1), // tab button border
              tabBorder: Border.all(
                  color: HexColor('#1E1E37'), width: 1), // tab button border
              // tab button shadow
              curve: Curves.easeInExpo, // tab animation curves
              duration: Duration(milliseconds: 1200), // tab animation duration
              gap: 2, // the tab button gap between icon and text
              color: Colors.grey[400], // unselected icon color
              activeColor: Colors.white, // selected icon and text color
              //iconSize: 13, // tab button icon size
              tabBackgroundColor:
                  HexColor('#1E1E37'), // selected tab background color
              padding: EdgeInsets.symmetric(
                  horizontal: 0, vertical: 7), // navigation bar padding
              tabs: [
                GButton(
                  iconSize: 14,
                  margin: EdgeInsets.only(left: 7, top: 5, bottom: 5),
                  icon: Icons.home,
                  text: 'Home',
                  textSize: 6,
                ),
                GButton(
                  iconSize: 14,
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  icon: Icons.storage,
                  text: 'storage',
                  textSize: 10,
                ),
                GButton(
                  iconSize: 14,
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  icon: Icons.shopping_cart,
                  text: 'Store',
                ),
                GButton(
                  iconSize: 14,
                  margin: EdgeInsets.only(top: 5, bottom: 5, right: 7),
                  icon: Icons.person,
                  text: 'Profile',
                )
              ]),
        ),
      ),
    ));
  }
}
