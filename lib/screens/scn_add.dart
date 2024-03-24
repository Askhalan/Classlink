// ignore_for_file: unused_import, unused_field, no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:classlink/db/functions/db_functions.dart';
import 'package:classlink/db/model/data_model.dart';
import 'package:classlink/screens/scn_home.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../tabs/tb_list.dart';
import '../widgets/popup_image_pic.dart';

class Add extends StatefulWidget {
  const Add({super.key});
  

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final _nameController = TextEditingController();
  final _idController = TextEditingController();
  final _phoneController = TextEditingController();
  final _placeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final bool _currentValidate = true;
  RegExp characterRegExp = RegExp(r'[a-zA-Z]');
  RegExp noNumbersRegExp = RegExp(r'^[0-9]+$');
  RegExp numericRegExp = RegExp(r'^[0-9]+$');
  XFile? _imageFile; // Nullable type for _imageFile

  final ImagePicker _picker = ImagePicker();
  final String _defaultImagePath = 'assets/images/profile_default.png';

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
    );

    if (pickedFile != null) {
      setState(() {
        _imageFile = XFile(pickedFile.path); // Update _imageFile with the selected image
      });
    }
  }

  void _showPicImgPopup(BuildContext context) async {
    final selectedImage = await showDialog<XFile>(
      context: context,
      builder: (BuildContext context) {
        return PicImg(
          onImageSelected: (pickedFile) {
            Navigator.of(context).pop(pickedFile); // Close the popup and pass the selected image
          },
        );
      },
    );

    if (selectedImage != null) {
      setState(() {
        _imageFile = selectedImage; // Update _imageFile with the selected image
      });
    }
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
                              File(_imageFile?.path ?? _defaultImagePath)
                              ,
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _showPicImgPopup(context); // Show the PicImg popup
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
                                }else if(value[0]==value[0].toLowerCase()){
                                  return 'First letter should be Captial';
                                }else if(numericRegExp.hasMatch(value)){
                                  return 'Name contains digit';
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
                                  
                                }else if(characterRegExp.hasMatch(value)){
                                  return 'Please enter a valid ID';
                                } else if(characterRegExp.hasMatch(value)){
                                  return 'Input field contains letters';
                                } else if(value.length!=5){
                                  return 'Please enter a valid ID';
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
                                }else if(characterRegExp.hasMatch(value)){
                                  return 'Input field contains letters';
                                } else if(value.length!=10){
                                  return 'Please valid phone number';
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
                                }else if(numericRegExp.hasMatch(value)){
                                  return 'Please enter a place name';
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
                            onPressed: () {
                             _formKey.currentState!.validate();
                              if(_formKey.currentState!.validate()){
                                onAddStudentButtonClicked();
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home(),));
                              }
                              
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 41, 50, 83),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            child: const Text(
                              'Save',
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
  
   Future<void> onAddStudentButtonClicked ()async{
      final _name = _nameController.text;
      final _schoolId = _idController.text;
      final _phone = _phoneController.text;
      final _place = _placeController.text;
      final _student =StudentModel(name: _name, schoolId: _schoolId, phone: _phone, place: _place,image: _imageFile!.path);
      addStudent(_student);
    }
}





