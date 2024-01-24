
import 'dart:io';
import 'package:contracterApp/controller/db_provider.dart';
import 'package:contracterApp/db/model/model.dart';
import 'package:contracterApp/controller/Worker_detsil.dart';
import 'package:contracterApp/view/details.dart';
import 'package:contracterApp/view/edit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListWorkers extends StatefulWidget {
  final String? selectedJobCategory;
  const ListWorkers({Key? key, this.selectedJobCategory}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _ListStudentState createState() => _ListStudentState();
}

class _ListStudentState extends State<ListWorkers> {
  String ? image;
  @override
  void initState() {
    super.initState(); 
    Provider.of<DbProvider>(context,listen: false).getAllStud();
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: buildStudentList(),
     backgroundColor: const Color.fromARGB(255, 148, 148, 148),
      );
  }
  
Widget buildStudentCard(Jobworkers data, int index) {
  return GestureDetector(
    onTap: () {
       Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return Details(name: data.name, number: data.number, age:data. age, jobcategories:data. jobcategories,image: data.image!,);
      },));
    },
    child: Padding(
      padding: EdgeInsets.all(12),
      child: Card(
        color: Color.fromARGB(255, 241, 227, 227),
        child: Container(
          padding: EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                maxRadius: 30,
                backgroundColor: Colors.black,
                backgroundImage: FileImage(File(data.image!)),
              ),
              SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text('Name: ${data.name}',style:TextStyle(fontStyle: FontStyle.italic) ,),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('MOB: ${data.number}'),
                          Text('Age: ${data.age}'),
                          Text( 'Job:${data.jobcategories}'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () { 
                      showModalBottomSheet(context: context, builder: (context) {
                        return EditScreen(name: data.name, number:data. number, age:data.age, jobCategories:data. jobcategories, index: index, image:data.image!,);
                      },);
                    },
                    icon: Icon(Icons.edit),
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(context: context,
                       builder:(context) {
                         return AlertDialog(
                          title: Text('Are you sure want to delete'),
                          actions: [
                            TextButton(onPressed: (){
                              Navigator.pop(context);
                            }, child:Text('close')),
                            TextButton(onPressed: (){
                             Provider.of<DbProvider>(context,listen: false).deletestud(index);
                              Navigator.pop(context);
                            }, child: Text('Delete'))
                          ],
                         );
                       },);
                     },
                    icon: Icon(Icons.delete),
                    color: Colors.red,
                     ),
                   ],
                 ),
               ],
             ),
          ),
        ),
      ),
    );
  }
   Widget buildStudentList() {
    return Consumer2<DbProvider,Workerdetail>(
      builder: (context, dbvalue, mirror, child)  {
        mirror.filteredworkerList = List.from(mirror.workersList); 
        return ListView.separated(
          itemBuilder: (ctx, index) {
            final data = dbvalue.workersList[index];
            return buildStudentCard(data, index);
          },
          separatorBuilder: (ctx, index) {
            return const Divider();
          },
          itemCount:dbvalue.workersList.length,
        );
      },
    );
  }
}