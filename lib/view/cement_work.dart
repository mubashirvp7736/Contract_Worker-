// import 'dart:io';
// import 'package:contracterApp/db/function/functions.dart';
// import 'package:contracterApp/db/model/model.dart';
// import 'package:contracterApp/view/details.dart';
// import 'package:contracterApp/view/edit.dart';
// import 'package:flutter/material.dart';

// class Cement extends StatefulWidget {
//   final String? selectedJobCategory;

//   const Cement({Key? key, this.selectedJobCategory}) : super(key: key);

//   @override
//   _ListStudentState createState() => _ListStudentState();
// }

// class _ListStudentState extends State<Cement> {
//   TextEditingController searchController = TextEditingController();
//   List<Jobworkers> workersList = [];
//   List<Jobworkers> filteredworkerList = [];

//   bool isSearching = false;

//   @override
//   void initState() {
//     super.initState();
//     getAllStud();
//   }

//   void filterworkers(String search) {
//     if (search.isEmpty) {
//       setState(() {
//         filteredworkerList = List.from(workersList);
//       });
//     } else {
//       setState(() {
//         filteredworkerList = workersList
//             .where((student) =>
//                 student.name.toLowerCase().contains(search.toLowerCase()))
//             .toList();
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white24,
//           title: isSearching ? buildSearchField() : Text("workers List"),
//           automaticallyImplyLeading: false,
//           actions: [
//             IconButton(
//               onPressed: () {
//                 setState(() {
//                   isSearching = !isSearching;
//                   if (!isSearching) {
//                     searchController.clear();
//                     filteredworkerList = List.from(workersList);
//                   }
//                 });
//               },
//               icon: Icon(isSearching ? Icons.cancel : Icons.search),
//             ),
//           ],
//         ),
//         body: Center(
//           child: isSearching
//               ? filteredworkerList.isNotEmpty
//                   ? ListView.separated(
//                       itemBuilder: (ctx, index) {
//                         final data = filteredworkerList[index];
//                         return buildStudentCard(data, index);
//                       },
//                       separatorBuilder: (ctx, index) {
//                         return const Divider();
//                       },
//                       itemCount: filteredworkerList.length,
//                     )
//                   : Center(
//                       child: Text("No results found."),
//                     )
//               : buildStudentList(),
//         ),
//         backgroundColor: const Color.fromARGB(255, 148, 148, 148),
//       ),
//     );
//   }

//   Widget buildSearchField() {
//     return TextField(
//       controller: searchController,
//       onChanged: (query) {
//         filterworkers(query);
//       },
//       autofocus: true,
//       style: TextStyle(
//         color: Colors.white,
//       ),
//       decoration: InputDecoration(
//         hintText: "Search students...",
//         hintStyle: TextStyle(
//           color: Colors.white.withOpacity(0.7),
//         ),
//         border: InputBorder.none,
//       ),
//     );
//   }

//   Widget buildStudentCard(Jobworkers data, int index) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//           return Details(
//             name: data.name,
//             number: data.number,
//             age: data.age,
//             jobcategories: data.jobcategories,
//             image: data.image!,
//           );
//         }));
//       },
//       child: Card(
//         color: Color.fromARGB(255, 241, 227, 227),
//         child: Container(
//           padding: EdgeInsets.all(15),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               CircleAvatar(
//                 maxRadius: 30,
//                 backgroundColor: Colors.black,
//                 backgroundImage: FileImage(File(data.image!)),
//               ),
//               SizedBox(width: 15),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     ListTile(
//                       title: Text(data.name),
//                       subtitle: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(data.number),
//                           Text(data.age),
//                           Text(data.jobcategories),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Column(
//                 children: [
//                   IconButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                          builder: (context) => editScreen(
//                           index: index,
//                           name: data.name,
//                           number: data.number,
//                           age: data.age,
//                           jobCategory: data.jobcategories ,
//                           image: data.image!,
//                         ),
//                        ),
//                       );
//                     },
//                     icon: Icon(Icons.edit),
//                     color: Color.fromARGB(255, 0, 0, 0),
//                   ),
//                   IconButton(
//                     onPressed: () {
//                       deletestud(index);
//                     },
//                     icon: Icon(Icons.delete),
//                     color: Colors.red,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

import 'dart:io';
import 'package:contracterApp/controller/db_provider.dart';
import 'package:contracterApp/db/model/model.dart';
import 'package:contracterApp/controller/tab_view.dart';
import 'package:contracterApp/controller/Worker_detsil.dart';
import 'package:contracterApp/view/details.dart';
import 'package:contracterApp/view/edit.dart';
import 'package:contracterApp/view/search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cement extends StatefulWidget {
  final String? selectedJobCategory;
  const Cement({Key? key, this.selectedJobCategory}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _ListStudentState createState() => _ListStudentState();
}

class _ListStudentState extends State<Cement> {
  String ? image;
  @override
  void initState() {
    super.initState(); 
     Provider.of<DbProvider>(context,listen: false).getAllStud();
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[700],
          title: Text('CementWorkers'),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){
              
         Navigator.push(context,MaterialPageRoute(builder:(context) =>  Searchworker()));  
            }, icon: Icon(Icons.search,color: Colors.white,))
          ],
  ),
    body: buildStudentList(),
  ));}
   
 
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
    return 
     Consumer<DbProvider>(
  builder: (context, dbvalue, child) {
    final filteredWorkerList = dbvalue.workersList
        .where((worker) => worker.jobcategories.contains('CementWork'))
        .toList();
    
    Provider.of<Workerdetail>(context).filteredworkerList = List.from(filteredWorkerList);

    return ListView.separated(
      itemBuilder: (ctx, index) {
        final data = filteredWorkerList[index];
        return buildStudentCard(data, index); 
      },
      separatorBuilder: (ctx, index) {
        return const Divider();
      },
      itemCount: filteredWorkerList.length,
    );
  },
);

  }
}
