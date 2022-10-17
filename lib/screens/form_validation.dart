import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:real_time_database/screens/banner.dart';
import 'package:real_time_database/screens/bottom_sheet.dart';
import 'package:real_time_database/screens/context_menu.dart';
import 'package:real_time_database/screens/dialogue_box.dart';
import 'package:real_time_database/screens/home_screen.dart';
import 'package:real_time_database/screens/segmented_control.dart';



class FormValidationExample extends StatefulWidget {
  @override
  State<FormValidationExample> createState() => _FormValidationExampleState();
}

class _FormValidationExampleState extends State<FormValidationExample> {
  final formGlobalKey = GlobalKey<FormState>();

  String? gender = 'male';

  String? dropdownValue = 'A';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Form validation '),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: formGlobalKey,
              child: Column(
                children: [
                  SizedBox(height: 30),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Email"),
                    validator: (email) {
                      if (isEmailValid(email!))
                        return null;
                      else
                        return 'Enter a valid email address';
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Name",
                    ),
                    //maxLength: 15,
                    validator: (name) {
                      if (isValidName(name!))
                        return null;
                      else
                        return 'Enter a valid name';
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Phone Number",
                    ),
                    //maxLength: 10,
                    obscureText: false,
                    validator: (phone) {
                      if (isValidPhone(phone!))
                        return null;
                      else
                        return 'Enter a valid Contact Number';
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Password",
                    ),
                    maxLength: 6,
                    obscureText: true,
                    validator: (password) {
                      if (isPasswordValid(password!))
                        return null;
                      else
                        return 'Enter a valid password';
                    },
                  ),

                      Text('Chhose Gender'),
                      SizedBox(height: 10.0),
                      Row(children: [
                        SizedBox(
                          width: 10,
                          child: Radio(
                            value: 'male',
                            groupValue: gender,
                            activeColor: Colors.orange,
                            onChanged: ( value) {
                              //value may be true or false
                              setState(() {
                                gender = value as String?;
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Text('Male')
                      ]),
                      Row(children: [
                        SizedBox(
                          width: 10,
                          child: Radio(
                            value: 'female',
                            groupValue: gender,
                            activeColor: Colors.orange,
                            onChanged: (value) {
                              setState(() {
                                gender = value as String?;
                              });
                            },
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Text('Female')
                      ]),
                      SizedBox(height: 10.0),
                      Text('Choose Country'),
                      SizedBox(height: 10.0),
                      Container(
                        padding: EdgeInsets.only(left: 5.0, right: 5.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(3.0)
                        ),
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          isExpanded: true,
                          icon: Icon(Icons.keyboard_arrow_down, size: 22),
                          underline: SizedBox(),
                          items: <String>['A', 'B', 'C', 'D'].map((String value) {
                            return new DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            //Do something with this value
                            setState(() {
                              dropdownValue = value;
                            });
                          },
                        ),
                      ),   

                  SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        if (formGlobalKey.currentState!.validate()) {
                          formGlobalKey.currentState!.save();
                          // use the email provided here
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new HomeScreen()),
                          );
                        }
                      },
                      child: Text("Real-time database")),
                  SizedBox(height: 15),
                  ElevatedButton(
                      onPressed: () {
                        if (formGlobalKey.currentState!.validate()) {
                          formGlobalKey.currentState!.save();
                          // use the email provided here
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new MyHomePage()),
                          );
                        }
                      },
                      child: Text("Segmented Control")),
                    SizedBox(height: 15),
                  ElevatedButton(
                      onPressed: () {
                        if (formGlobalKey.currentState!.validate()) {
                          formGlobalKey.currentState!.save();
                          // use the email provided here
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new ModalBottomSheet()),
                          );
                        }
                      },
                      child: Text("Bottom Sheet")),

                      SizedBox(height: 15),
                  ElevatedButton(
                      onPressed: () {
                        if (formGlobalKey.currentState!.validate()) {
                          formGlobalKey.currentState!.save();
                          // use the email provided here
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new MaterialBannerClass(title: 'Material Banner Example',)),
                          );
                        }
                      },
                      child: Text("Banner")),

                      
                      SizedBox(height: 15),
                  ElevatedButton(
                      onPressed: () {
                        if (formGlobalKey.currentState!.validate()) {
                          formGlobalKey.currentState!.save();
                          // use the email provided here
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new ContextMenu()),
                          );
                        }
                      },
                      child: Text("Context Menu")),

                       
                      SizedBox(height: 15),
                  ElevatedButton(
                      onPressed: () {
                        if (formGlobalKey.currentState!.validate()) {
                          formGlobalKey.currentState!.save();
                          // use the email provided here
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => new TestPage()),
                          );
                        }
                      },
                      child: Text("Dialogue boxes")),
                ],
              ),
            ),
          ),
        ));
  }
  
  bool isEmailValid(String email) {
    final RegExp regexp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)| (\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    //RegExp regexp = new RegExp(regexp);
    return regexp.hasMatch(email);
  }
  bool isValidName(String name) {
    final nameRegExp =
        new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(name);
  }

  bool isValidPhone(String phone) {
    final phoneRegExp = RegExp(r"[0-9]{10}$");
    return phoneRegExp.hasMatch(phone);
  }
  bool isPasswordValid(String password) => password.length == 6;
}

// mixin InputValidationMixin {
//   bool isPasswordValid(String password) => password.length == 6;

//   bool isEmailValid(String email) {
//     final RegExp regexp = RegExp(
//         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)| (\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
//     //RegExp regexp = new RegExp(regexp);
//     return regexp.hasMatch(email);
//   }

//   bool isValidName(String name) {
//     final nameRegExp =
//         new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
//     return nameRegExp.hasMatch(name);
//   }

//   bool isValidPhone(String phone) {
//     final phoneRegExp = RegExp(r"[0-9]{10}$");
//     return phoneRegExp.hasMatch(phone);
//   }
// }



// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';


// class FormValidation extends StatefulWidget {
//   @override
//   _FormValidationState createState() => _FormValidationState();
// }

// class _FormValidationState extends State<FormValidation> {

//   bool checkbox1 = true;
//   bool checkbox2 = false;
//   String gender = 'male';
//   String dropdownValue = 'A';
//   DateTime date = DateTime.now();
//   TimeOfDay time = TimeOfDay.now();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Form Widgets'),
//       ),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Container(
//           padding: EdgeInsets.all(10.0),
//           child: Column(children: [
//             Text('TextFormField'),
//             SizedBox(height: 10.0),
//             TextFormField(
//               keyboardType: TextInputType.text,
//               decoration: InputDecoration(
//                   hintText: 'write something',
//                   border: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.grey, width: 32.0),
//                       borderRadius: BorderRadius.circular(5.0)
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.grey, width: 1.0),
//                       borderRadius: BorderRadius.circular(5.0)
//                   )
//               ),
//               onChanged: (value) {
//                 //Do something with this value
//               },
//             ),
//             SizedBox(height: 10.0),
//             Text('Password Field'),
//             SizedBox(height: 10.0),
//             TextFormField(
//               keyboardType: TextInputType.text,
//               obscureText: true,
//               decoration: InputDecoration(
//                   hintText: 'password here',
//                   border: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.grey, width: 32.0),
//                       borderRadius: BorderRadius.circular(5.0)
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                       borderSide: BorderSide(color: Colors.grey, width: 1.0),
//                       borderRadius: BorderRadius.circular(5.0)
//                   )
//               ),
//               onChanged: (value) {
//                 //Do something with this value
//               },
//             ),
//             SizedBox(height: 10.0),
//             Text('Checkbox'),
//             SizedBox(height: 10.0),
//             Row(children: [
//               SizedBox(
//                 width: 10,
//                 child: Checkbox(
//                   value: checkbox1,
//                   activeColor: Colors.orange,
//                   onChanged: (value) {
//                     //value may be true or false
//                     setState(() {
//                       checkbox1 = !checkbox1;
//                     });
//                   },
//                 ),
//               ),
//               SizedBox(width: 10.0),
//               Text('This is Checkbox 1')
//             ]),
//             Row(children: [
//               SizedBox(
//                 width: 10,
//                 child: Checkbox(
//                   value: checkbox2,
//                   activeColor: Colors.orange,
//                   onChanged: (value) {
//                     //value may be true or false
//                     setState(() {
//                       checkbox2 = !checkbox2;
//                     });
//                   },
//                 ),
//               ),
//               SizedBox(width: 10.0),
//               Text('This is Checkbox 2')
//             ]),
//             SizedBox(height: 10.0),
//             Text('Radio Button'),
//             SizedBox(height: 10.0),
//             Row(children: [
//               SizedBox(
//                 width: 10,
//                 child: Radio(
//                   value: 'male',
//                   groupValue: gender,
//                   activeColor: Colors.orange,
//                   onChanged: ( value) {
//                     //value may be true or false
//                     // setState(() {
//                     //   gender = value;
//                     // });
//                   },
//                 ),
//               ),
//               SizedBox(width: 10.0),
//               Text('Male')
//             ]),
//             Row(children: [
//               SizedBox(
//                 width: 10,
//                 child: Radio(
//                   value: 'female',
//                   groupValue: gender,
//                   activeColor: Colors.orange,
//                   onChanged: (value) {
//                     //value may be true or false
//                     // setState(() {
//                     //   gender = value;
//                     // });
//                   },
//                 ),
//               ),
//               SizedBox(width: 10.0),
//               Text('Female')
//             ]),
//             SizedBox(height: 10.0),
//             Text('DropDown Button'),
//             SizedBox(height: 10.0),
//             Container(
//               padding: EdgeInsets.only(left: 5.0, right: 5.0),
//               decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: BorderRadius.circular(3.0)
//               ),
//               child: DropdownButton<String>(
//                 value: dropdownValue,
//                 isExpanded: true,
//                 icon: Icon(Icons.keyboard_arrow_down, size: 22),
//                 underline: SizedBox(),
//                 items: <String>['A', 'B', 'C', 'D'].map((String value) {
//                   return new DropdownMenuItem<String>(
//                     value: value,
//                     child: new Text(value),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   //Do something with this value
//                   // setState(() {
//                   //   dropdownValue = value;
//                   // });
//                 },
//               ),
//             ),
//             SizedBox(height: 10.0),
//             Text('Date Picker'),
//             SizedBox(height: 10.0),
//             // InkWell(
//             //   onTap: () async {
//             //     final DateTime? picked = await showDatePicker(
//             //       context: context,
//             //       initialDate: date,
//             //       firstDate: DateTime(1994),
//             //       lastDate: DateTime(2101),
//             //       builder: (BuildContext context, Widget child) {
//             //         return Theme(
//             //           data: ThemeData.dark(),
//             //           child: child,
//             //         );
//             //       },
//             //     );
//             //     if (picked != null && picked != date)
//             //       setState(() {
//             //         date = picked;
//             //       });
//             //   },
//             //   child: Text('$date Click to open date picker'),
//             // ),
//             SizedBox(height: 10.0),
//             Text('Time Picker'),
//             SizedBox(height: 10.0),
//             InkWell(
//               onTap: () async {
//                 final TimeOfDay? picked = await showTimePicker(
//                   context: context,
//                   initialTime: time,
//                   // builder: (BuildContext context, Widget child) {
//                   //   return Theme(
//                   //     data: ThemeData.dark(),
//                   //     child: child,
//                   //   );
//                   // },
//                 );
//                 if (picked != null && picked != time)
//                   setState(() {
//                     time = picked;
//                   });
//               },
//               child: Text('$time Click to open time picker'),
//             ),
//             SizedBox(height: 10.0),
//             Text('Buttons'),
//             SizedBox(height: 10.0),
//             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//               ElevatedButton(
//                 //color: Colors.green,
//                 child: Text('Click', style: TextStyle(color: Colors.white)),
//                 onPressed: () {
//                   //Do Something
//                 },
//               ),
//               MaterialButton(
//                 color: Colors.orange,
//                 child: Text('Click', style: TextStyle(color: Colors.white)),
//                 onPressed: () {
//                   //Do Something
//                 },
//               ),
//               Container(
//                 color: Colors.lightBlue,
//                 child: RawMaterialButton(
//                   child: Text('Click', style: TextStyle(color: Colors.white)),
//                   onPressed: () {
//                     //Do Something
//                   },
//                 ),
//               )
//             ])
//           ])
//         ),
//       )
//     );
//   }
// }