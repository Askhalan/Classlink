import 'package:flutter/material.dart';

class Menus extends StatelessWidget {
  const Menus({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
            onSelected: (value) {
              if (value == 1) {
              } else if (value == 2) {
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<int>(
                value: 1,
                child: ListTile(
                  leading: Icon(Icons.edit),
                  title: Text('Edit'),
                ),
              ),
              const PopupMenuItem<int>(
                value: 2,
                child: ListTile(
                  leading: Icon(Icons.delete),
                  title: Text('Delete'),
                ),
              ),
            ],
          );
  }
}


