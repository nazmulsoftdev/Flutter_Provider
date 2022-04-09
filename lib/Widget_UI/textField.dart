import 'package:flutter/material.dart';

//Title Field

Widget TitleField(_titleController) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.only(left: 5),
      child: TextFormField(
        controller: _titleController,
        decoration:
            InputDecoration(hintText: "Title", border: InputBorder.none),
        validator: (val) {
          if (val!.isEmpty) {
            return "Can\'t be Empty";
          } else {
            return null;
          }
        },
      ),
    ),
  );
}

// Description Field

Widget DescriptionField(_descriptionController) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.only(left: 5),
      child: TextFormField(
        controller: _descriptionController,
        decoration:
            InputDecoration(hintText: "Description", border: InputBorder.none),
        validator: (val) {
          if (val!.isEmpty) {
            return "Can\'t be Empty";
          } else {
            return null;
          }
        },
      ),
    ),
  );
}
