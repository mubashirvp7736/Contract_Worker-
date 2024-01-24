
// import 'dart:io';

// import 'package:contracterApp/db/function/functions.dart';
// import 'package:contracterApp/db/model/model.dart';
// import 'package:contracterApp/provider/providerdetails.dart';
// import 'package:contracterApp/view/workersDetails.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';



// // class addstuds extends StatefulWidget {
// //   addstuds({super.key});

// //   @override
// //   State<addstuds> createState() => _addstudsState();
// // }

// // class _addstudsState extends State<addstuds> {
//    class addstuds extends StatelessWidget {
//   addstuds({super.key});

 
//   final _namecontroller=TextEditingController();
//   final _numbercontroller=TextEditingController();
//   final _agecontroller=TextEditingController();
//   final ImagePicker imagePicker=ImagePicker();
//   File? picked;

//   final _formkey = GlobalKey<FormState>();
// // String? _selectedJobCategory;

//   @override
//   Widget build(BuildContext context) {
    
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body:  Form(
//           key: _formkey,
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 25),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(height: 5,),
//                   GestureDetector(
                    
//                     onTap: () =>Provider.of<providerDemo>(context).images(ImageSource.gallery),
//                     child: CircleAvatar(backgroundColor: Colors.orange[200],child:
//                     picked== null?Icon(Icons.add_a_photo):ClipOval(child: Image.file(picked!,fit: BoxFit.cover,   height: 120,
//                               width: 120,),),
//                     radius: 60,),
//                   ),

//                    SizedBox(height: 10,),
//                   TextFormField(
//                     keyboardType:TextInputType.text ,
//                     inputFormatters:[FilteringTextInputFormatter.allow(RegExp(r'[a-zA-z\s]'))],
//                     controller:_namecontroller ,
//                     decoration: InputDecoration(
//                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
//                     labelText: "Name",
//                     hintText: "Enter your Name",
//                     prefixIcon: Icon(Icons.person),
//                   ),
//                    validator: (value){
//                             if(value==null || value.isEmpty){
//                               return 'value is empty';
//                             }else{
//                               return null;
//                             }
                          
//                   },
//                   ),
//                   SizedBox(height: 10,),
//                     TextFormField(
//                     keyboardType: TextInputType.phone,
//                     inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                    controller:_numbercontroller,
//                    decoration:InputDecoration(
//                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
//                    labelText: "phone",
//                    hintText: "enter your phone number",
//                    prefixText: "+91",
//                    prefixIcon:Icon(Icons.phone),
//                   ),
//                   maxLength: 10,
//                   validator: (value){
//                     if(value==null ||value.isEmpty){
//                       return 'value is empty';
//                     }
//                     else{
//                       return null;
//                     }
//                   }
//                   ),
//                   SizedBox(height: 10,),
//                   TextFormField(
//                     keyboardType: TextInputType.phone,
//                     inputFormatters:[FilteringTextInputFormatter.digitsOnly ],
//                     controller: _agecontroller,
//                     decoration:InputDecoration(
//                       border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
//                     labelText: "Age",
//                     hintText: "Enter your Age",
//                     prefixIcon: Icon(Icons.calendar_month_outlined),
//                   ),
//                   maxLength: 3,
//                   validator: (value){
//                     if(value==null ||value.isEmpty){
//                       return 'value is empty';
//                     }
//                     else{
//                       return null;
//                     }
//                   }
//                   ),
//                   SizedBox(height: 10,),
//                  DropdownButtonFormField<String>(
//         value: Provider.of<providerDemo>(context).selectedjob(),
//         items: ['CementWork', 'BuildingWork', 'SocialWork', 'Painting']
//         .map<DropdownMenuItem<String>>((String value) {
//      return DropdownMenuItem<String>(
//       value: value,
//       child: Text(value),
//      );
//     }).toList(),
//     onChanged: (String? newValue) {
    
//       dynamic namu= Provider.of<providerDemo>(context).selectedjob(); 
//       namu=newValue;
//     },
//     decoration: InputDecoration(
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(20),
//     ),
//     labelText: "Job Categories",
//     hintText: "Select your job category",
//     prefixIcon: Icon(Icons.work),
//   ),
//   validator: (value) {
//     if (value == null || value.isEmpty) {
//       return 'Please select a job category';
//       } else {
//       return null;
//            }
//       },
//    ),

//      SizedBox(height: 10,),
//         ElevatedButton(onPressed: (){
//      if(_formkey.currentState!.validate()){
//       onAddStudentOnClick(context);
//   Navigator.push(context, MaterialPageRoute(builder: (context) => ListWorkers(selectedJobCategory:Provider.of<providerDemo>(context).selectedjob() ,)));
//     }
//           }, child: Text("Add"))
              
//                 ] 
//                 ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> onAddStudentOnClick(context)async{
  
//     final _name=_namecontroller.text.trim();
//      final _numb=_numbercontroller.text.trim();
//     final _age=_agecontroller.text.trim();
//     final _jobcategories=Provider.of<providerDemo>(context).selectedjob()??''; 
//     if(_name.isEmpty||_age.isEmpty||_jobcategories.isEmpty){
//       return;
//     }

//    final _student= Jobworkers(name: _name, number: _numb, age:_age,jobcategories:_jobcategories,image: picked?.path??'', );
    
//     addstud(_student);

//   }
// //    getimage(ImageSource source) async {
// //     var img = await imagePicker.pickImage(source: ImageSource.gallery);
// //     setState(() {
// //       picked = File(img!.path);
      
// //     });
  
// // }
// }
import 'package:contracterApp/controller/add_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class Addstuds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        body:Consumer<Addworkers>(builder: (context, value, child) => 
         Form(  
          key:value.formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 5,),
                  GestureDetector(
                    onTap: () =>
                        Provider.of<Addworkers>(context, listen: false)
                            .pickImage(ImageSource.gallery),
                    child: CircleAvatar(
                      backgroundColor: Colors.orange[200],
                      // ignore: sort_child_properties_last
                      child: Provider.of<Addworkers>(context).pickedImage ==
                              null
                          ? Icon(Icons.add_a_photo)
                          : ClipOval(
                              child: Image.file(
                                Provider.of<Addworkers>(context).pickedImage!,
                                fit: BoxFit.cover,
                                height: 120,
                                width: 120,
                              ),
                            ),
                      radius: 60,
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-z\s]'))
                    ],
                    controller:value.nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: "Name",
                      hintText: "Enter your Name",
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name is required';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller:value.numberController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: "Phone",
                      hintText: "Enter your phone number",
                      prefixText: "+91",
                      prefixIcon: Icon(Icons.phone),
                    ),
                    maxLength: 10,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Phone number is required';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    controller:value.ageController ,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: "Age",
                      hintText: "Enter your Age",
                      prefixIcon: Icon(Icons.calendar_month_outlined),
                    ),
                    maxLength: 3,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Age is required';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 10,),
                  DropdownButtonFormField<String>(
                    value: Provider.of<Addworkers>(context).selectedJob,
                    items: ['CementWork', 'BuildingWork', 'SocialWork', 'Painting']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      Provider.of<Addworkers>(context, listen: false)
                          .selectJobCategory(newValue!);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "Job Categories",
                      hintText: "Select your job category",
                      prefixIcon: Icon(Icons.work),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a job category';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 10,),
                  ElevatedButton(
                    onPressed: (){
                      if ( value. formKey.currentState!.validate()) {
                    Provider.of<Addworkers>(context,listen: false).onAddStudentOnClick(context);
                      }
                    },
                    child: Text("Add"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }}

  
