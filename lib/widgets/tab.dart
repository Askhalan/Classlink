import 'package:flutter/material.dart';

import '../tabs/tb_grid.dart';
import '../tabs/tb_list.dart';

class Tbar extends StatelessWidget {
  const Tbar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 0, 191, 140) ,
              borderRadius: BorderRadius.only(
                
              )

            ),
           
            child: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.view_list_outlined,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.grid_view,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                )
              ],
            ),
          ),            
           Expanded(

            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 239, 239, 239),
                borderRadius: BorderRadius.only(
                  topLeft:Radius.circular(30),
                  topRight:Radius.circular(30),
                )

              ),
            
              child: const TabBarView(
                  children: [
                    TbList(),
                    TbGrid(),
                    
                  ],
                ),
            ),
          ),
          
        ],
      ),
    );
  }
}
