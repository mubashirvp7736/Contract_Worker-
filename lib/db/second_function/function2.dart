import 'package:contracterApp/db/second_model/model2.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

ValueNotifier<List<ProfileModel>>  profilNotifier = ValueNotifier([]);

Future<void>addToProfile(ProfileModel value)async{
 final profile_db= await Hive.openBox<ProfileModel>('profiledb');
 profile_db.add(value);
 profilNotifier.notifyListeners();
}
getallprofile()async{
  final profile_db= await Hive.openBox<ProfileModel>('profiledb');
  profilNotifier.value.clear();
  profilNotifier.value.addAll(profile_db.values);
  profilNotifier.notifyListeners();
}
Future<void>logout()async{
  final profile_db= await Hive.openBox<ProfileModel>('profiledb');
  profile_db.clear();
  getallprofile();
}