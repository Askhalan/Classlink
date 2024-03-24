import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProgressCard extends StatefulWidget {
   const ProgressCard({super.key});

  @override
  State<ProgressCard> createState() => _ProgressCardState();
}

class _ProgressCardState extends State<ProgressCard> {
  //  GridCard({required String name , required int id,});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 160,
      width: 115,     
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(10)

      ),
      child: Column(
        children: [
          CircularPercentIndicator(
            center: const Text('43',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
            radius: 40,
            percent: 0.4,
            lineWidth: 9,
            progressColor: const Color.fromARGB(255, 0, 173, 127),
            backgroundColor:const Color.fromARGB(87, 145, 255, 226),
            circularStrokeCap: CircularStrokeCap.round,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text('Subject',style: TextStyle(fontSize: 16),),
            )
            
          
          
        ],
      ),
      
    );
  }
}