import 'package:app4/Widget_UI/textField.dart';
import 'package:app4/provider/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // define height and width for responsive

    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    // define form _key
    final _formKey = GlobalKey<FormState>();

    // define Controller for get user input text
    TextEditingController _titleController = TextEditingController();
    TextEditingController _descriptionController = TextEditingController();

    // define provider

    final todo = Provider.of<TodoProvider>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: Text("Store Data"),
                  content: Container(
                    height: 300,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TitleField(_titleController),
                          SizedBox(
                            height: 5,
                          ),
                          DescriptionField(_descriptionController),
                          SizedBox(
                            width: double.maxFinite,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  var title_Data = _titleController.text;
                                  var description_Data =
                                      _descriptionController.text;
                                  todo.addAction(title_Data, description_Data);
                                  title_Data = "";
                                  description_Data = "";
                                  Navigator.pop(context);
                                }
                              },
                              child: Text("Add"),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    width: _width,
                    height: _height,
                    child: ListView.builder(
                        itemCount: todo.todos.length,
                        itemBuilder: (_, index) {
                          return Card(
                            child: ListTile(
                              title: Text(todo.todos[index].title.toString()),
                              subtitle: Text(
                                  todo.todos[index].description.toString()),
                              trailing: Container(
                                width: 100,
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          todo.removeAction(index);
                                        },
                                        icon: Icon(
                                          Icons.remove_circle_outlined,
                                          color: Colors.redAccent,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ))),
    );
  }
}
