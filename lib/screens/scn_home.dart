
// ignore_for_file: unused_import

import 'package:classlink/db/functions/db_functions.dart';
import 'package:classlink/screens/scn_add.dart';
import 'package:classlink/widgets/tab.dart';
import 'package:flutter/material.dart';

import '../tabs/tb_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    final searchController =TextEditingController();
    return Scaffold
    (
      backgroundColor:const Color.fromARGB(255, 0, 191, 140),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const Add(),));
        },
        backgroundColor:const Color.fromARGB(255, 0, 191, 140),
        child: const Icon(Icons.add),
        
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 66,
              color: const Color.fromARGB(255, 0, 191, 140),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          width: 370,
                          height: 40,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 237, 237, 237),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child:  TextFormField(
                            onChanged: (value)async{
                              await search(value);
                            },
                            controller: searchController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 9.0, horizontal: 15.0),
                              hintText: "Search",
                              border: InputBorder.none,
                              suffixIcon: IconButton(onPressed: ()async{
                                searchController.clear();
                                getAllStudents();
                              }, 
                              icon: const Icon(Icons.cancel_outlined))
                              //  ,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Expanded(child: Tbar()),
            
    ])));


   
  }
}