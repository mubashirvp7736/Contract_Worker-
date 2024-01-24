 import 'package:hive_flutter/adapters.dart';
 part 'model.g.dart';
@HiveType(typeId: 1)

class Jobworkers {

@HiveField(0)
 int? index;

@HiveField(1)
final String name ;

@HiveField(2)
final String number;

@HiveField(3)
final String age ;

@HiveField(4)
final String jobcategories;

@HiveField(5)
final String? image;

Jobworkers({ required this.name,required this.number, required this.age,required this.jobcategories, this.index,this.image});
}