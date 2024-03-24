import 'package:flutter/material.dart';

import '../db/functions/db_functions.dart';
import '../db/model/data_model.dart';
import '../widgets/grid_card.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';

class TbGrid extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const TbGrid({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container
      (
         margin: const EdgeInsets.only(top: 7),
         child: ValueListenableBuilder(
           builder: (BuildContext ctx, List<StudentModel> studentList , Widget? child){
             return GridView.builder(
              gridDelegate:const SliverGridDelegateWithMaxCrossAxisExtent(
              mainAxisExtent: 220,
              maxCrossAxisExtent:200,
              crossAxisSpacing: 1,
              mainAxisSpacing: 0
            
              ), 
            itemBuilder: (context, index) {
              final data = studentList[index];
               return Container(
                
                padding: const EdgeInsets.all(14),
                child: GridCard(data: data,));
               },
            itemCount: studentList.length,
            ) ;
             },
           valueListenable: studentListNotifier, 
         )
        
      ),
    );
  }
}
