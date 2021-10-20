import 'package:flutter/material.dart';
import 'package:flutter_todolist/models/category.dart';
import 'package:flutter_todolist/service/category_service.dart';
import 'home_screen.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  var _categoryNameController = TextEditingController();
  var _categoryDescriptionController = TextEditingController();
  var _category = Category();
  var _categoryService = CategoryService();


  _showFormDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            actions: <Widget>[
              FlatButton( // todo FlatButton
                color: Colors.red,
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
              FlatButton( // todo FlatButton
                color: Colors.blue,
                onPressed: () {
                  //print('Category: ${_categoryNameController.text}');
                  //print('Description: ${_categoryDescriptionController.text}');
                  _category.name = _categoryNameController.text;
                  _category.description = _categoryDescriptionController.text;
                  _categoryService.saveCategory(_category);
                },
                child: Text('Save'),
              ),
            ],
            title: Text('Categories Form'),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _categoryNameController,
                    decoration: InputDecoration(
                      hintText: 'Write a category',
                      labelText: 'Category',
                    ),
                  ),
                  TextField(
                    controller: _categoryDescriptionController,
                    decoration: InputDecoration(
                      hintText: 'Write a description',
                      labelText: 'Description',
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( //todo RaisedButton
        leading: RaisedButton(
          // for navigation back to home, not to drawer
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomeScreen())),
          elevation: 0.0,
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          color: Colors.blue,
        ),
        title: Text('Categories'),
      ),
      body: Center(child: Text('Welcome to Categories')),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showFormDialog(context);
          },
          child: Icon(Icons.add)),
    );
  }
}
