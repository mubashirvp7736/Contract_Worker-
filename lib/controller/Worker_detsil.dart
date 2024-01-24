
import 'package:contracterApp/db/model/model.dart';
import 'package:flutter/material.dart';

class Workerdetail with ChangeNotifier {

  //   List<Jobworkers> filteredworkerList = [];
  //   List<Jobworkers> workersList = [];
  //   final TextEditingController searchController = TextEditingController();
  // bool  isSearching = false;
  // void filterworkers(String search) {

  //   if (search.isEmpty) { 
  //       filteredworkerList = List.from(workersList);
  //       notifyListeners();
    
  //   }else{
  //       filteredworkerList = workersList
  //           .where((student) =>
  //               student.name.toLowerCase().contains(search.toLowerCase()))
  //           .toList();
  //     }
  //        notifyListeners();
  //   }
    
  
  //  void serachh(){
  //   isSearching = !isSearching;
  //       if (!isSearching) {
  //         searchController.clear();
  //        filteredworkerList = List.from(workersList);
  //        notifyListeners();
  //       }
  //  }
  
  
  List<Jobworkers> filteredworkerList = [];
  List<Jobworkers> workersList = [];
   TextEditingController searchController = TextEditingController();
  bool isSearching = false;

  void filterworkers(String search) {
    if (search.isEmpty) {
      filteredworkerList = List.from(workersList);
      notifyListeners();
    } else {
      filteredworkerList = workersList
          .where((worker) =>
              worker.name.toLowerCase().contains(search.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  void serachh() {
    isSearching = !isSearching;
    if (!isSearching) {
      searchController.clear();
      filteredworkerList = List.from(workersList);
    }
    notifyListeners();
  }
}

  
