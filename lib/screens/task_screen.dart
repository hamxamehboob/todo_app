import 'package:flutter/material.dart';
import 'package:todo_app/Screens/widgets/text_field_box.dart';

import 'widgets/list_widget.dart';

class TaskScreen extends StatefulWidget {
  TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
  bool valuefirst = false;
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  List<String> items = [];

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          // Navigator.of(context).push<String>(
          //     MaterialPageRoute(builder: (_) =>));
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      backgroundColor: Color(0xFFCDD6E8),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 100, left: 25),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              "Today's Tasks",
              style: TextStyle(
                  color: Color(0xFF222121),
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            ListView(
              children: [
                // items.map((text) => AddListWidget())
              ],
            ),
            AddListWidget(),
            AddListWidget(),
            // AddListWidget(),
            // AddListWidget(),
            SizedBox(height: 443),
            // Text(),
            Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery
                        .of(context)
                        .viewInsets
                        .bottom
                )
            )
          ]),
        ),
      ),
    );
  }
}
// Widget item(String text) => Padding(
//     padding: const EdgeInsets.only(right: 20),
//     child: Container(
//         margin: EdgeInsets.all(10),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20), color: Colors.white),
//         child: Row(children: [
//           Checkbox(
//               shape: CircleBorder(),
//               checkColor: Colors.greenAccent,
//               activeColor: Colors.lightGreen,
//               value: this.valuefirst,
//               onChanged: (value) {
//                 setState(() {
//                   this.valuefirst = value!;
//                 });
//               }),
//           SizedBox(
//             width: 20,
//           ),
//           Text(
//             "Create UI",
//             style: TextStyle(
//                 color: Color(0xFF040404),
//                 fontSize: 14,
//                 fontWeight: FontWeight.w400),
//           ),
//           SizedBox(width: 80,),
//           Icon(Icons.edit,color: Colors.grey,),
//           SizedBox(width: 10,),
//           Icon(Icons.delete,color: Colors.red,)
//         ]
//         )
//     )
// );