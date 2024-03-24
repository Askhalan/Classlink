import 'dart:io';

import 'package:classlink/db/functions/db_functions.dart';
import 'package:classlink/screens/scn_edit.dart';
import 'package:classlink/screens/scn_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../db/model/data_model.dart';

class TbList extends StatelessWidget {
  const TbList({super.key, Key? k});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 7),
        decoration: const BoxDecoration(
          // color: Colors.amber,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),

          )
        ),
         child: ValueListenableBuilder(
           valueListenable: studentListNotifier,
           builder: (BuildContext ctx, List<StudentModel> studentList , Widget? child) {
             return  ListView.builder(
             itemCount: studentList.length,
             itemBuilder: (context, index) {
              final data = studentList[index];
               return Padding
               (
                 padding: const EdgeInsets.only(left: 10,right: 10,top: 18),
                 child: Container
                 (
                   height: 80,
                   width:370 ,
                   decoration: BoxDecoration(
                       color: const Color.fromARGB(255, 255, 255, 255),
                       borderRadius: BorderRadius.circular(5),
                     ),
                   child: Slidable
                   (
                     startActionPane: ActionPane
                     (motion: const BehindMotion(), 
                     children: 
                     [
                       SlidableAction
                       (
                         icon: Icons.delete,
                         backgroundColor: Colors.red,
                         onPressed: (context){
                          deleteStudent(data.id!);
                         }
                       ),
                       SlidableAction
                       (
                         icon: Icons.edit,
                         backgroundColor: const Color.fromARGB(255, 0, 136, 255),
                         onPressed: (context)=>{
                           Navigator.push(context, MaterialPageRoute(builder: (context) =>  EditScn(data: data),))
                         }
                       )
                     ],),
             
                     child: ListTile
                     (
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  Profile(Data: data),));
                      },
                       title: Text(data.name),
                       subtitle:  Text(data.schoolId),
                       leading:  CircleAvatar
                       (
                         radius: 30,
                        //  backgroundColor: Color.fromARGB(255, 113, 219, 255),
                         backgroundImage: FileImage(File(data.image)),
      
                       ),
                       trailing: Text('${index+1}'),
                     ),
                   ),
                 ),
               );
             },
           );
           },
         ),
           
         ),
       );
  }
}
