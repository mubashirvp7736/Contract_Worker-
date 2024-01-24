import 'package:contracterApp/db/second_function/function2.dart';
import'package:flutter/material.dart';
Widget Aboute(){
   return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      title: Text('About'),
    ),    body:SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(35),
        child: Container(
          height: 600,
          decoration: BoxDecoration( color: Colors.white,// Background color
              borderRadius: BorderRadius.circular(20),// Rounded corners
              border: Border.all(
                
                color: Colors.black,
                width: 3,)),
          child: Column(
            children: [
              Text('User Authentication:',style: TextStyle(fontSize: 23,decoration: TextDecoration.underline),),
              Text('-> Contractors should be able to create accounts and log in securely.'),
              SizedBox(height: 6,),
              Text('Dashboard:',style: TextStyle(fontSize: 23,decoration: TextDecoration.underline),),
              Text('->Upon logging in, the contractor is greeted with a dashboard.'),
             Text('->The dashboard displays a summary of the total number of workers and other relevant information.'),
             SizedBox(height: 6,),
             Text('Add Workers:',style: TextStyle(fontSize: 23,decoration: TextDecoration.underline),),
             Text('->Contractors can add new workers to their team.'),
           Text('->When adding a worker, the contractor inputs details such as name, age, phone number, job category, and an optional profile picture.'),
          Text('->The app allows contractors to categorize workers based on job types e.g., cement work, building work, etc'),
          SizedBox(height: 6,),
          Text('Error Handling',style: TextStyle(fontSize: 23,decoration: TextDecoration.underline),),
          Text('->Handle errors gracefully. For example, if a worker can'),
          Text( '->added due to validation errors or if theres an issue with local storage, provide appropriate error messages to the user.')
            ],
          ),
        ),
      ),
    )
    
     );

}
