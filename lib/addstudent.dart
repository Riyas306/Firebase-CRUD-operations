import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studentfirebase/maindrawer.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({Key? key}) : super(key: key);

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const MainDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 25),
            child: Icon(Icons.person_add,color: Colors.orange,size: 50,),
          ),
          const SizedBox(height:10),
        const  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text("Add Student Details", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,)),
          ),
          const SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:25),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: "Name",
                fillColor: Colors.grey[300],
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(12)
                )
              ),
              
            ),
          ),
          const SizedBox(height: 20,),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 25),
             child: TextField(
               controller: _emailController,
              decoration: InputDecoration(
                hintText: "Email",
                fillColor: Colors.grey[300],
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(12)
                )
              ),
              
          ),
           ),
           const SizedBox(height: 20,),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 25),
             child: TextField(
               controller: _phoneController,
              decoration: InputDecoration(
                hintText: "Phone",
                fillColor: Colors.grey[300],
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(12)
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue),
                  borderRadius: BorderRadius.circular(12)
                )
              ),
              
          ),
           ),
           const SizedBox(height: 20,),
           ElevatedButton(onPressed: (){
             submit();
           }, child: const Text('Submit'))
        ],
      ),
     
    );
  }

  Future<void> submit() async{

    final _name = _nameController.text.trim();
    final _email = _emailController.text.trim();
    final _phone = _phoneController.text.trim();
    if(_name == "" || _email == "" || _phone==""){
     return showDialog(context: context, builder: (BuildContext context){
       return const AlertDialog(
         title: Text("Something went wrong"),
       );
     });
    }
    else{

    try{
      await FirebaseFirestore.instance.collection('students').add(
      {
        'name' : _name,
        'email' : _email,
        'phone' : _phone
      }
    );
    }on FirebaseException catch(e){
      print(e);
    }
    }
  _nameController.text = "";
  _emailController.text="";
  _phoneController.text="";
    
  }
}