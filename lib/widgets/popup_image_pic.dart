import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PicImg extends StatelessWidget {
  final Function(XFile?) onImageSelected; // Function to pass the selected image path

  const PicImg({super.key, required this.onImageSelected});

  void _handleCameraButton(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      onImageSelected(XFile(pickedFile.path)); // Convert PickedFile to XFile and pass it to the parent
    }
  }

  void _handleGalleryButton(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      onImageSelected(XFile(pickedFile.path)); // Convert PickedFile to XFile and pass it to the parent
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Set border radius here
      ),
      backgroundColor: const Color.fromARGB(255, 236, 236, 236),
      title: const Align(
        alignment: Alignment.center,
        child: Text('Choose image from'),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => _handleCameraButton(context),
                child: const Column(
                  children: [
                    Icon(Icons.photo_camera,
                        size: 50, color: Color.fromARGB(255, 123, 123, 123)),
                    Text(
                      'Camera',
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => _handleGalleryButton(context),
                child: const Column(
                  children: [
                    Icon(Icons.add_photo_alternate,
                        size: 50, color: Color.fromARGB(255, 123, 123, 123)),
                    Text(
                      'Gallery',
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Close',
                style: TextStyle(fontSize: 18),
              ))
        ],
      ),
    );
  }
}
