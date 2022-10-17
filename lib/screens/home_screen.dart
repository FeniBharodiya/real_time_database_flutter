import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:real_time_database/screens/view_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _taskController = TextEditingController();
  final _ref = FirebaseDatabase.instance.ref().child("Tasks");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Store data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                TextFormField(
                  controller: _taskController,
                  decoration: InputDecoration(hintText:"Enter task"),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Enter task";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 13,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (!_formkey.currentState!.validate()) {
                      return;
                    }
                    _formkey.currentState!.save();
                    _ref.push().set(_taskController.text).then((value) =>  Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewData())) );
                  },
                  child: Text("Submit"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
