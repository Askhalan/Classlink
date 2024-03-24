import 'dart:io';

import 'package:classlink/screens/scn_profile.dart';
import 'package:flutter/material.dart';

import '../db/functions/db_functions.dart';
import '../screens/scn_edit.dart';

class GridCard extends StatelessWidget {
  const GridCard({super.key, required this.data});
  // ignore: prefer_typing_uninitialized_variables
  final data;
  // ignore: prefer_typing_uninitialized_variables



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
         Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(Data: data),));
      },
      child: Container(
        height: 200,
        width: 160,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Stack(
              children: [
                Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PopupMenuButton<int>(
                onSelected: (value) {
                  if (value == 1) {
                    // Handle Edit action
                  } else if (value == 2) {
                    // Handle Delete action
                  }
                },
                itemBuilder: (BuildContext context) => [
                   PopupMenuItem<int>(
                    
                    
                    value: 1,
                    child: ListTile(
                      tileColor:const Color.fromARGB(255, 0, 136, 255),
                      leading: IconButton(
                        onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context) =>  EditScn(data: data),));
                        }, 
                        icon: const Icon(Icons.edit,color: Color.fromARGB(255, 255, 255, 255),),),
                      title: const Text('Edit'),
                    ),
                  ),
                   PopupMenuItem<int>(
                    value: 2,
                    child: ListTile(
                      tileColor: Colors.red,
                      leading:IconButton(
                        onPressed: (){
                         deleteStudent(data.id!);
                        }, 
                        icon: const Icon(Icons.delete,color: Color.fromARGB(255, 255, 255, 255),),),
                      // leading: Icon(Icons.delete,color: Color.fromARGB(255, 255, 255, 255),),
                      title: const Text('Delete'),
                    ),
                  ),
                ],
                ),
              ],
            ),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
              padding: const EdgeInsets.only(top: 19, left: 10),
              child: CircleAvatar(
                    backgroundImage: FileImage(File(data.image)),
                    radius: 40,
              ),
            ),
                  ],
                ),
    
              ],
            ),
           
            
             Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                data.name,
                style: const TextStyle(
                  fontSize: 27,
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                'School id: ${data.schoolId}',
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
