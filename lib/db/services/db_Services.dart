// ignore: file_names
import 'package:contracterApp/db/model/model.dart';
import 'package:hive/hive.dart';
 class Jobworkservices{

  Future<List<Jobworkers>>getAllStud()async{
   final studentDb= await Hive.openBox<Jobworkers>("jobworker_db");
   return studentDb.values.toList();
  }
 
Future <void> addstud(Jobworkers value)async{
  
  final jobworkerDb = await Hive.openBox<Jobworkers>("jobworker_db");
   await jobworkerDb.add(value);
}
 
Future<void> deletestud(int index)async{
  final jobworkerDb= await Hive.openBox<Jobworkers>("jobworker_db"); 
   jobworkerDb.deleteAt(index);
 }

Future<void> Logout()async{
  final jobworkerDb= await Hive.openBox<Jobworkers>("jobworker_db"); 
   await jobworkerDb.clear();
}

  Future updateTrip(id, Jobworkers value) async {
    final jobWorkerDb = await Hive.openBox<Jobworkers>("jobworker_db");
    await jobWorkerDb.putAt(id, value);
   
  }
 }