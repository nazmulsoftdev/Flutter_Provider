import 'package:app4/model/todo_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class TodoProvider extends ChangeNotifier {
  List<TodoModel> todos = [];

//  add user value by this action

  addAction(title, description) {
    var dataStore = new TodoModel(title: title, description: description);
    todos.add(dataStore);
    notifyListeners();
  }

//  delete specific user value by this action

  removeAction(index) {
    todos.removeAt(index);
        notifyListeners();
  }







}
