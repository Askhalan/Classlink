// ignore: non_constant_identifier_names
// ignore_for_file: unused_element, unused_local_variable, invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../model/data_model.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

late Database _dbCloud;

// CODE TO INITIALIZE DATABASE
Future<void> initializeDatabase() async {
  _dbCloud = await openDatabase(
    'student.dbCloud',
    version: 1,
    onCreate: (Database _dbCloud, int version) {
      _dbCloud.execute(
          'CREATE TABLE student (id INTEGER PRIMARY KEY , name TEXT , schoolid TEXT , phone TEXT , place TEXT , image TEXT)'
          );
    },
  );
}

// CODE TO ADD STUDENT
Future<void> addStudent(StudentModel value) async {
  await _dbCloud.rawInsert(
      'INSERT INTO student (name,schoolid,phone,place,image) VALUES (?,?,?,?,?)',
      [value.name, value.schoolId, value.phone, value.place, value.image]);
  studentListNotifier.notifyListeners();
}

// CODE TO TRAVERSAL ALL STUDENT
Future<void> getAllStudents() async {
  studentListNotifier.value.clear();
  final values = await _dbCloud.rawQuery('SELECT * FROM student');
  for (var map in values) {
    final student = StudentModel.fromMap(map);
    studentListNotifier.value.add(student);
    studentListNotifier.notifyListeners();
  }
  studentListNotifier.notifyListeners();
}

// CODE TO DELETE STUDENT
Future<void> deleteStudent(int id) async {
  studentListNotifier.value.clear();
  await _dbCloud.rawDelete('DELETE FROM student WHERE id= ?', [id]);
  studentListNotifier.notifyListeners();
  await getAllStudents();
}

// CODE TO EDIT STUDENT
Future<void> editStudent(StudentModel data) async {
  _dbCloud.rawUpdate(
      'UPDATE student SET name =? ,schoolid =?, phone=?, place =?, image =? WHERE id = ?',
      [data.name, data.schoolId, data.phone, data.place, data.image, data.id]);
     studentListNotifier.value.clear();
  getAllStudents();
}

// CODE TO SEARCH IN STUDENT

Future<void> search(String name) async {
  final searchList = await _dbCloud.rawQuery('SELECT * FROM student');
  studentListNotifier.value.clear();
  for (var map in searchList) {
    final student = StudentModel.fromMap(map);
    if (student.name.toLowerCase().contains(name.toLowerCase())) {
      studentListNotifier.value.add(student);
    }
  }

  studentListNotifier.notifyListeners();
}
