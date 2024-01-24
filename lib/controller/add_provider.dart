import 'dart:io';

import 'package:contracterApp/controller/db_provider.dart';
import 'package:contracterApp/db/model/model.dart';
import 'package:contracterApp/view/workers_details.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class Addworkers with ChangeNotifier{
  File? _picked;
String?  _selectedJobCategory;

  File? get pickedImage => _picked;
  String ? get selectedjob=>_selectedJobCategory;
  String? get selectedJob => _selectedJobCategory;
   final TextEditingController nameController = TextEditingController();
   final TextEditingController numberController = TextEditingController();
   final TextEditingController ageController = TextEditingController();
   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
Future<void> onAddStudentOnClick(context) async {
    final _name = nameController.text.trim();
    final _numb = numberController.text.trim();
    final _age =  ageController.text.trim();
    final _jobCategories =selectedJob ?? '';
    if (_name.isEmpty || _age.isEmpty || _jobCategories.isEmpty) {
      return;
    }
    notifyListeners();
    final worker = Jobworkers(
      name: _name,
      number: _numb,
      age: _age,
      jobcategories: _jobCategories,
      image: _picked?.path ?? '',
    );
     Provider.of<DbProvider>(context,listen: false).addworkers(worker);
     notifyListeners();
     nameController.clear();
    numberController.clear();
      ageController.clear();
       
   
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ListWorkers(selectedJobCategory: _jobCategories)),
    );
    
    notifyListeners();
  }
  void selectJobCategory(String newValue) {
    _selectedJobCategory = newValue;
    notifyListeners();
  }
  Future<void> pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    var img = await imagePicker.pickImage(source: source);
    _picked = File(img?.path ?? '');
    notifyListeners();
  }

}
