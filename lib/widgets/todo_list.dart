import 'package:flutter/material.dart';
import '../model/db_model.dart';
import 'list_widget.dart';

class TodoList extends StatelessWidget {
  final Function _insertFunction;
  final Function _deleteFunction;
  final Function _updateFunction;

  final _db = DatabaseConnect();

  TodoList({
    required Function insertFunction,
    required Function deleteFunction,
    Key? key,
    required Function updateFunction,
  })  : _updateFunction = updateFunction,
        _deleteFunction = deleteFunction,
        _insertFunction = insertFunction,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: _db.getTodo(),
        initialData: const [],
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
          dynamic data = snapshot.data;
          dynamic dataLength = data!.length;

          return dataLength == 0
              ? const Center(
                  child: Text(
                    'No Data Found!',
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                )
              : ListView.builder(
                  itemCount: dataLength,
                  itemBuilder: (context, i) => ListWidget(
                    id: data[i].id,
                    title: data[i].title,
                    creationDate: data[i].creationDate,
                    isChecked: data[i].isChecked,
                    insertFunction: _insertFunction,
                    deleteFunction: _deleteFunction,
                    updateFunction: _updateFunction,
                  ),
                );
        },
      ),
    );
  }
}
