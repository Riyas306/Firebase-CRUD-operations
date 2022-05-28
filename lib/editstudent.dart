



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:studentfirebase/homepage.dart';


class EditStudent extends StatefulWidget {
  final id;
   const EditStudent({Key? key,required this.id}) : super(key: key);

  @override
  State<EditStudent> createState() => _EditStudentState();
}

class _EditStudentState extends State<EditStudent> {
  final _nameController = TextEditingController();

  final _emailController = TextEditingController();

  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    getData(widget.id);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person_rounded,size: 50,color: Colors.blue,),
          const SizedBox(height: 10,),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal:25),
            child: Text('Edit Details', style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
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
             update(widget.id);
           }, child: const Text('Update'))
        ],
      ),
    );
  }

Future<void> update(id) async
  {
    if(_nameController.text == "")
    {
    return showDialog(context: context, builder: (BuildContext context){
       return const AlertDialog(
         title: Text("Input field cannot be null"),
       );
     });
    }
    else
    {
  final _data = await FirebaseFirestore.instance.collection('students').doc(id).update(
    {
      'name'  : _nameController.text.trim(),
      'email' : _emailController.text.trim(),
      'phone' : _phoneController.text.trim()
    }
  );
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomePage()));
    }
  }

  Future<void> getData(id) async
  {
    final _data = await FirebaseFirestore.instance.collection('students').doc(id).get();
    _nameController.text = _data['name'];
    _emailController.text = _data['email'];
    _phoneController.text = _data['phone'];
  }
}