import 'dart:io';
import 'package:contracterApp/db/second_function/function2.dart';
import 'package:contracterApp/db/second_model/model2.dart';
import 'package:contracterApp/view/drawer.dart';
import 'package:contracterApp/view/empty_screeen.dart';
import 'package:contracterApp/view/show_drawe.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
class Account extends StatelessWidget {
  Account({Key? key}) : super(key: key);

  List<String> listText = [ 'Account','about'];

  final screens = [
   details(),
   Aboute(),
   
    ];

  List<Icon> holcon = [
    const Icon(Icons.person, color: Colors.black),
    const Icon(Icons.person, color: Colors.black),
    const Icon(Icons.camera, color: Colors.black)
  ];

  File? picked;

  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                 CircleAvatar(
                  maxRadius: 70,
                   child: Lottie.asset('assets/Animation - 1702574011312.json'),
                 ),
                  const SizedBox(
                    width: 25,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.all(17),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => ListTile(
                  leading: holcon[index],
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return screens[index];
                      },
                    ));
                  },
                  trailing: const Icon(Icons.arrow_forward_ios, size: 15, color: Colors.black,),

                  title: Text(
                    listText[index],
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: 2,
              ),
            ),
            const SizedBox(height: 150,),
            const Center(
              child: Text('Version 9.15.0', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}

