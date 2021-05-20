import 'package:flutter/material.dart';
import 'package:todo/models/category.dart';
import 'package:todo/services/category_service.dart';

import 'home_screen.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  var _category = Category();
  var _categoryService = CategoryService();
  var _categoryName = TextEditingController();
  var _categoryDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories Screen"),
        leading: ElevatedButton(
          child: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
      ),
      body: Center(
        child: Text("Welcome to Categories Screen!"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          _showFormInDialog(context);
        },
      ),
    );
  }

  _showFormInDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (param) {
          return AlertDialog(
            title: Text("Category Form:"),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        labelText: "Category Name:",
                        hintText: "Write category name"),
                    controller: _categoryName,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Category description:",
                      hintText: "Write category descrition",
                    ),
                    controller: _categoryDescription,
                  )
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  _category.name = _categoryName.text;
                  _category.description = _categoryDescription.text;
                  _categoryService.save(_category);
                },
                child: Text("Save"),
              ),
              TextButton(
                onPressed: () {},
                child: Text("Cancel"),
              ),
            ],
          );
        });
  }
}
