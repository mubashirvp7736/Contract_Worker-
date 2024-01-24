 import 'package:hive_flutter/adapters.dart';
 part 'model2.g.dart';
@HiveType(typeId: 2)

class ProfileModel {

 @HiveField(0)
 int? index;

@HiveField(1)
final String name ;

@HiveField(2)
final String number;

@HiveField(3)
final String age ;

@HiveField(4)
final String? image;

ProfileModel({required this.name,required this.number,required this.age, this.index,this.image});

  get jobcategorie => null;
}