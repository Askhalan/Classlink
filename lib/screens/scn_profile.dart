// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:classlink/db/model/data_model.dart';
import 'package:classlink/widgets/progress_card.dart';
import 'package:flutter/material.dart';

import '../db/functions/db_functions.dart';
import '../tabs/progress_grid.dart';
import 'scn_edit.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.Data});

  final StudentModel Data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 232, 232),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 232, 232, 232),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text(
          Data.name,
          style: const TextStyle(fontSize: 26, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(),
          child: ListView(
            children: [
              Stack(
                children: [
                  Container(
                    height: 400,
                  ),
                  Positioned(
                    top: 75,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromARGB(66, 0, 221, 207),
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 13),
                        height: 280,
                        width: 385,
                        padding: const EdgeInsets.only(top: 20),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 80),
                          child: Column(
                            children: [
                              Text(
                                Data.name,
                                style: const TextStyle(fontSize: 30),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      Data.schoolId,
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    const Text(
                                      'Dep: CS',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      width: 100,
                                      child: ElevatedButton.icon(
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  EditScn(data: Data),));
                                        },
                                        icon: const Icon(Icons.edit),
                                        label: const Text('Edit'),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                            const Color.fromARGB(
                                                255, 41, 50, 83),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 110,
                                      child: ElevatedButton.icon(
                                        onPressed: () {
                                          deleteStudent(Data.id!);
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(Icons.delete),
                                        label: const Text('Delete'),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                            const Color.fromARGB(
                                                255, 41, 50, 83),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // circles for profiles
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 175,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 232, 232, 232),
                          // border:Border.all(
                          //   color: Color.fromARGB(255, 232, 232, 232),
                          //   width: 15,
                          // )
                        ),
                      ),
                      Container(
                        height: 150,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/images/pathu.jpg'),
                              fit: BoxFit.fill),
                        ),
                        child: CircleAvatar(
                          radius: 100,
                          backgroundImage: FileImage(File(Data.image)),
                          // child:
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(66, 0, 221, 207),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 13),
                // height: 300,
                width: 385,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Progress',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ProgressCard(),
                          ProgressCard(),
                          ProgressCard(),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ProgressCard(),
                          ProgressCard(),
                          ProgressCard(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          width: 110,
                          child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const ProgressGrid(),
                                    ));
                              },
                              icon: const Icon(Icons.update),
                              label: const Text('Update'),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(255, 41, 50, 83),
                                ),
                              ))),
                    )
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(66, 0, 221, 207),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 13),
                  height: 300,
                  width: 385,
                  padding: const EdgeInsets.all(20),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 00),
                    child: Column(
                      children: [
                        const Text(
                          'Personal Details',
                          style: TextStyle(fontSize: 25),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Place: ${Data.place}',
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Phone:  ${Data.phone}',
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        '',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 25),
              //   child: Container(
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(20),
              //       color: const Color.fromARGB(66, 0, 221, 207),
              //     ),
              //     margin: const EdgeInsets.symmetric(horizontal: 13),
              //     height: 300,
              //     width: 385,
              //     padding: const EdgeInsets.all(20),
              //     child: const Padding(
              //       padding: EdgeInsets.only(top: 00),
              //       child: Column(
              //         children: [
              //           Text('Contact Details',style: TextStyle(fontSize: 25),),
              //           Padding(
              //             padding: EdgeInsets.only(top: 20),
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //               children: [
              //                 Text('ID: 12756',style: TextStyle(fontSize: 18),),
              //                 Text('Dep: CS',style: TextStyle(fontSize: 18),),
              //               ],
              //             ),
              //           ),
            ],
          ),
        ),
      ),
    );

  }
}
