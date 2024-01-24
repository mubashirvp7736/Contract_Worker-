
import 'package:contracterApp/db/model/model.dart';
import 'package:flutter/material.dart';

class Tabviewdetail with ChangeNotifier{

  List<Jobworkers> filteredworkerList = [];
  List<Jobworkers> workersl = [];
  void filterworkers(String search) {

    if (search.isEmpty) { 
        filteredworkerList = List.from(workersl);
        notifyListeners();
    
    }else{
        filteredworkerList = workersl
            .where((student) =>
                student.name.toLowerCase().contains(search.toLowerCase()))
            .toList();
            notifyListeners();
      }
    }
    
  bool  isSearching = false;
  
   TextEditingController searchController = TextEditingController();
   void serachh(){
    isSearching = !isSearching;
        if (!isSearching) {
          searchController.clear();
         filteredworkerList = List.from(workersl);
         notifyListeners();
        }
        notifyListeners();
   }
  

}