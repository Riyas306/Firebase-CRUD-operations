

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studentfirebase/editstudent.dart';
import 'package:studentfirebase/maindrawer.dart';

class HomePage extends StatefulWidget {
   const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const MainDrawer(),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('students').snapshots(),
        builder: (context, snapshot){
          if(!snapshot.hasData)
          {
            return const Center(child: CircularProgressIndicator());
          }
          else
          {
           return Padding(
             
             padding: const  EdgeInsets.all(20),
             child: ListView(
                children: snapshot.data!.docs.map((document){
                  return Card(
                    color: Colors.blue,
                    shadowColor: Colors.black,
                    elevation: 5,
                    child: GestureDetector(
                      onTap: (() {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EditStudent(id: document.id)));
                      }),
                      child: ListTile(
                        title:  Text(document['name'], style: const TextStyle(color: Colors.white),),
                        subtitle: Text(document['phone'], style: const TextStyle(color: Colors.white),),
                        trailing: IconButton(onPressed: (){
                          removeStudent(document.id);
                        }, icon: const Icon(Icons.delete),
                        color: Colors.red,),
                      ),
                    ),
                  );
                }).toList(),
                
              ),
           );
          }
        }),
    );
  }
  Future<void> removeStudent(id) async{
    await FirebaseFirestore.instance.collection('students').doc(id).delete();
  }
}