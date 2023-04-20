import 'package:flutter/material.dart';

class TextField extends StatefulWidget {
  const TextField({Key? key}) : super(key: key);

  @override
  State<TextField> createState() => _TextFieldState();
}

class _TextFieldState extends State<TextField> {
  TextEditingController InputTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 60),
      child: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(41)),
        child: Padding(
          padding: const EdgeInsets.only(left: 80),
          child: TextField(
            controller: InputTextFieldController,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
            decoration: InputDecoration(
                hintText: 'Write a text',
                hintStyle: TextStyle(
                  color: Color(0xFFA4A0A0),
                  fontSize: 18,
                ),
                border: InputBorder.none
            ),
          ),
        ),
      ),
    );
  }
}
