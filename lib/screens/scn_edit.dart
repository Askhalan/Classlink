// ignore_for_file: unused_import, unused_field, no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:io';

import 'package:classlink/db/functions/db_functions.dart';
import 'package:classlink/db/model/data_model.dart';
import 'package:classlink/screens/scn_home.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../tabs/tb_list.dart';
import '../widgets/popup_image_pic.dart';

class EditScn extends StatefulWidget {
  const EditScn ({super.key, required this.data});
  final StudentModel data;

  
  @override
  State<EditScn> createState() => _EditScnState();
  
}

class _EditScnState extends State<EditScn> {
  // final StudentModel data;
 
  final _formKey = GlobalKey<FormState>();
  final bool _currentValidate = true;
  String? _imagef;

  final ImagePicker _picker = ImagePicker();
  

  // _EditScnState(this.data);

  

  
 
  void takePhoto() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

      setState(() {
        _imagef = pickedFile!.path;
      });
    
  }

  // void _showPicImgPopup(BuildContext context) async {
  //   final selectedImage = await showDialog<XFile>(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return PicImg(
  //         onImageSelected: (pickedFile) {
  //           Navigator.of(context).pop(pickedFile); // Close the popup and pass the selected image
  //         },
  //       );
  //     },
  //   );
  // }

   final TextEditingController _nameController = TextEditingController();
  final _idController = TextEditingController();
  final _phoneController = TextEditingController();
  final _placeController = TextEditingController();
  String? _defaultImagePath;

  @override
  void initState() {

    _nameController.text =widget.data.name;
    _idController.text= widget.data.schoolId;
    _phoneController.text = widget.data.phone;
    _placeController.text = widget.data.place;
    _defaultImagePath = widget.data.image;
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 201, 188),
        elevation: 0,
      ),
      backgroundColor: const Color.fromARGB(255, 0, 201, 188),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 180,
              color: const Color.fromARGB(255, 0, 201, 188),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 0,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        ClipOval(
                          child: SizedBox(
                            height: 150, // Set the desired height
                            width: 150, // Set the desired width
                            child: Image.file(
                              File(_imagef==null?_defaultImagePath!:_imagef!)
                              
                              ,
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            takePhoto(); // Show the PicImg popup
                          },
                          icon: const Icon(
                            Icons.camera_alt,
                            size: 36,
                            color: Color.fromARGB(255, 41, 50, 83),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 40, left: 25, right: 25, bottom: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 246, 246, 246),
                          ),
                          height: 60,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              left: 22,
                              right: 20,
                            ),
                            child: TextFormField(
                              controller: _nameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your name';
                                } else {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
                                hintText: 'Name',
                                border: InputBorder.none,
                              ),
                              // controller: _username,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 25, right: 25),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 246, 246, 246),
                          ),
                          height: 60,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 8, left: 22, right: 20),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'School Id',
                                border: InputBorder.none,
                              ),
                              controller: _idController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your School Id';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                          
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 30, left: 25, right: 25),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 246, 246, 246),
                          ),
                          height: 60,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 8, left: 22, right: 20),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Phone',
                                border: InputBorder.none,
                              ),
                              controller: _phoneController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your phone number';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 30, left: 25, right: 25),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 246, 246, 246),
                          ),
                          height: 60,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(top: 8, left: 22, right: 20),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Place',
                                border: InputBorder.none,
                              ),
                              controller: _placeController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your place';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 30, left: 25, right: 25),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(500),
                            color: const Color.fromARGB(255, 246, 246, 246),
                          ),
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () async{
                            //  _formKey.currentState!.validate();
                              await onUpdateButtonClicked();
                              // ignore: use_build_context_synchronously
                              Navigator.of(context).pop();
                              // ignore: use_build_context_synchronously
                              Navigator.of(context).pop();
                             

                              
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 41, 50, 83),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            child: const Text(
                              'Update',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );  
  }
     Future<void> onUpdateButtonClicked ()async{
      final _nameUpdated = _nameController.text;
      final _schoolIdUpdated = _idController.text;
      final _phoneUpdated = _phoneController.text;
      final _placeUpdated = _placeController.text;
      final final_image;
      if(_imagef==null){
        final_image = _defaultImagePath;
      }else{
        final_image = _imagef;
      }
      final studentUpdated =StudentModel(id: widget.data.id, name: _nameUpdated, schoolId: _schoolIdUpdated, phone: _phoneUpdated, place: _placeUpdated,image:final_image);
      await editStudent(studentUpdated);
    }
}





