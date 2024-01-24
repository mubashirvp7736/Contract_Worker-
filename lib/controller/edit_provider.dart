import 'package:flutter/material.dart';

// ignore: camel_case_types
class editprovider with ChangeNotifier{

   String? selectedJobCategory;
    void editcontroller(){
     (String? newValue) {
    selectedJobCategory = newValue;
      notifyListeners();
                  };
   }
  
}