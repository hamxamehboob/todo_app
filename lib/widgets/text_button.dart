import 'package:flutter/material.dart';

class TextBoxButton extends StatelessWidget {
  const TextBoxButton(
      {Key? key, required this.placeholder, required this.navigation})
      : super(key: key);
  final String placeholder;
  final GestureTapCallback navigation;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: GestureDetector(
                    onTap: () {
                      navigation();
                    },
                    child: Text(
                      placeholder,
                      style: const TextStyle(
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
