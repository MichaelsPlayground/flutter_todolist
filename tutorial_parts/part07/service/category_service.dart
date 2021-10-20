import 'package:flutter_todolist/models/category.dart';
import 'package:flutter_todolist/repositories/repository.dart';

class CategoryService{

  late Repository _repository;

  CategoryService(){
    _repository = Repository();
  }


  saveCategory (Category category) async {
    return await _repository.insertData('categories', category.categoryMap());

    // print(category.name);
    // print(category.description);
  }
}