import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:real_time_database/screens/view_data.dart';

class UpdateScreen extends StatefulWidget {
  final String value;
  const UpdateScreen({required this.value});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}
class _UpdateScreenState extends State<UpdateScreen> {
  TextEditingController _textController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final _ref = FirebaseDatabase.instance.ref().child("Tasks");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
            child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: "Enter Updatedvalue",
                ),
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "Enter Updated Value";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  if (!_formkey.currentState!.validate()) {
                    return;
                  }
                  _formkey.currentState!.save();
                  String _text = _textController.text;
                  _ref.child(widget.value).set(_text);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ViewData()));
                },
                child: Text("Update"),
              ),
            ],
          ),
        ),),
      ),
    );
  }
}
