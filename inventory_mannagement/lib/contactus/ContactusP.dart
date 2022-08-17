import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ContactusP extends StatefulWidget {
  const ContactusP({Key? key}) : super(key: key);

  @override
  State<ContactusP> createState() => _ContactusPState();
}

class _ContactusPState extends State<ContactusP> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          height: 380,
          width: 280,
          color: Colors.green,
        ),
      ),
    );
  }
}
