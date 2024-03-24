import 'package:flutter/material.dart';

import '../widgets/progress_card.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';

class ProgressGrid extends StatelessWidget {
   const ProgressGrid ({super.key, Key? k});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container
      (
         margin: const EdgeInsets.only(top: 7),
         child: GridView.builder(
          gridDelegate:const SliverGridDelegateWithMaxCrossAxisExtent(
            mainAxisExtent: 170,
            maxCrossAxisExtent:190,
            crossAxisSpacing: 1,
            mainAxisSpacing: 0
          
            ), 
          itemBuilder: (context, index) {
             return Container(
              padding: const EdgeInsets.all(5),
              child: ProgressCard());
             },
          itemCount: 6,
          ),
    
      ),
    );
  }
}
