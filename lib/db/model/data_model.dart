// ignore_for_file: unused_local_variable

class StudentModel {
  int? id;
  final String name;
  final String schoolId;
  final String phone;
  final String place;
  final String image;

// Constructor
  StudentModel(
      {this.id,
      required this.name,
      required this.schoolId,
      required this.phone,
      required this.place,
      required this.image});

// Function to Convert MAP into CLASS
  static StudentModel fromMap(Map<String?, Object?> map) {
    final id = map['id'] as int;
    final name = map['name'] as String;
    final schoolId = map['schoolid'] as String;
    final phone = map['phone'] as String;
    final place = map['place'] as String;
    final image = map['image'] as String;
    return StudentModel(
        id: id,
        name: name,
        schoolId: schoolId,
        phone: phone,
        place: place,
        image: image);
  }
}
