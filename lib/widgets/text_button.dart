import 'package:flutter/material.dart';

import '../Screens/task_screen.dart';

class TextBoxButton extends StatelessWidget {
  const TextBoxButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Padding(
                  padding: EdgeInsets.only(left: 100),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => TaskScreen()));
                    },
                    child: Text(
                      "Submit task",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 18),
                    ),
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
