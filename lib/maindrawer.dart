import 'package:flutter/material.dart';
import 'package:studentfirebase/homepage.dart';

import 'addstudent.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:  ListView(
    // Important: Remove any padding from the ListView.
    padding: EdgeInsets.zero,
    children: [
       DrawerHeader(
        decoration: const BoxDecoration(
          color: Colors.blue,
        ),
        child: Column(
          children: [

          const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.black,
            ),

          const SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:const [
                Text("User_Name"),
              ],
            ),


            
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children:const [
                Text("phone number"),
              ],
            )
          ],
        ),
      ),
      ListTile(
        title: const Text('Home'),
        onTap: () {
         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const HomePage()));
        },
      ),
      ListTile(
        title: const Text('Add Student'),
        onTap: () {
         Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const AddStudent()));
        },
      ),
    ],
  ),
    );
  }
}