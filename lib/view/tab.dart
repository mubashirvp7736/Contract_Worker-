
import 'package:contracterApp/view/building_work.dart';
import 'package:contracterApp/view/cement_work.dart';
import 'package:contracterApp/view/painting.dart';
import 'package:contracterApp/view/social_work.dart';
import 'package:flutter/material.dart';
class TabPage extends StatelessWidget {
  List<String> jobCategories = ['CementWork', 'BuildingWork', 'SocialWork', 'Painting'];

  List categor = [
    const Cement(),
    const Building(),
    const Social(),
    const Painting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => categor[index],
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(color: Colors.blueGrey[200],
              borderRadius: BorderRadius.circular(50), 
              border: Border.all(
                color: Colors.black,
                width: 9,)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Column(
                    children: [
                      Text(jobCategories[index], style: const TextStyle(fontSize: 20,fontStyle:FontStyle.italic,color: Colors.black)),
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: jobCategories.length,
        ),
      ),
    );
  }
}
