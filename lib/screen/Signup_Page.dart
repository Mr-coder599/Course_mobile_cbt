import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_material_app/UserRegister.dart';
import 'package:course_material_app/screen/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  SignupPage({
    Key? key,
  }) : super(
          key: key,
        );
  late final User user;
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final firestore = FirebaseFirestore.instance;
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final emailaddress = TextEditingController();
  final password = TextEditingController();
  // final fullnames = TextEditingController();
  // final genderController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  // late final User user;
  late bool isPasswordTextField = true;
  bool showPassword = true;
  late String pass = "";
  late String emails = "";
  // String dropdownvalue = 'Male';
  // // String dropdownbalues = 'Student';
  // var items = [
  //   'Male',
  //   'Female',
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Course Material App'),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 40.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 50.0,
                    ),
                    // Text(
                    //   'Student Signing Up',
                    //   style: TextStyle(
                    //     color: Colors.green,
                    //     fontSize: 20.0,
                    //     fontWeight: FontWeight.w200,
                    //     fontFamily: 'Times New Roman',
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 30.0,
                    // ),
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage("assets/images/logo.jpg"),
                      //  color: Colors.white,
                    ),
                    //  Image.asset("assets/educationpng.png"),
                    // SizedBox(
                    //   height: 30.0,
                    // ),
                    // SizedBox(
                    //   height: 16,
                    // ),
                    // TextFormField(
                    //     controller: fullnames,
                    //     decoration: InputDecoration(
                    //         labelText: 'FullName',
                    //         prefixIcon: Icon(
                    //           Icons.person,
                    //           color: Theme.of(context).primaryColor,
                    //         ),
                    //         border: OutlineInputBorder()),
                    //     // onChanged: (val) {
                    //     //   setState(() {
                    //     //     email = val;
                    //     //   });
                    //     // },
                    //     validator: (val) {
                    //       if (val!.isNotEmpty) {
                    //         return null;
                    //       } else {
                    //         return 'Required Fullname';
                    //       }
                    //     }),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    // DropdownButton(
                    //     isExpanded: true,
                    //     hint: Text('Select type '),
                    //     value: dropdownvalue,
                    //     icon: Icon(Icons.keyboard_arrow_down),
                    //     borderRadius: BorderRadius.circular(20),
                    //     dropdownColor: Colors.white,
                    //     style: TextStyle(
                    //         // backgroundColor: Colors.blue,
                    //         color: Colors.blue,
                    //         fontSize: 20,
                    //         fontWeight: FontWeight.bold),
                    //     items: items.map((String items) {
                    //       return DropdownMenuItem(
                    //         value: items,
                    //         child: Text(items),
                    //       );
                    //     }).toList(),
                    //     onChanged: (String? newValue) {
                    //       setState(() {
                    //         dropdownvalue = newValue!;
                    //         genderController.text = newValue;
                    //       });
                    //     }),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Please supply valid email address',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: _requiredValidator,
                      controller: emailaddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                        label: Text('EmailAddress'),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      // validator: (val) =>
                      //     val!.isEmpty ? 'Required emailAddress' : null,
                      // onChanged: (val) {
                      //   setState(() => emails = val);
                      // }
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    TextFormField(
                      validator: _requiredValidator,
                      obscureText: isPasswordTextField ? showPassword : true,
                      controller: password,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          icon: Icon(Icons.remove_red_eye),
                        ),
                        border: OutlineInputBorder(),
                        label: Text('Password'),
                      ),
                      keyboardType: TextInputType.text,
                      maxLength: 8,
                      // validator: (val) =>
                      //     val!.isEmpty ? 'Required password' : null,
                      // onChanged: (val) {
                      //   setState(() => pass = val);
                      // }
                    ),
                    SizedBox(
                      height: 30.0,
                    ),

                    SizedBox(
                      width: double.infinity,
                      child: loading
                          ? CircularProgressIndicator()
                          : ElevatedButton(
                              onPressed: () async {
                                setState(() {
                                  loading = true;
                                });
                                if (_formKey.currentState!.validate()) {
                                  try {
                                    final credential = await _auth
                                        .createUserWithEmailAndPassword(
                                            email: emailaddress.text,
                                            password: password.text);
                                    final user = credential.user;
                                    if (user != null) {
                                      //  UserRegister();
                                      CircularProgressIndicator();
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (_) => RegisterReg(
                                                  //    user: user
                                                  )));
                                    }
                                  } on FirebaseAuthException catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(e.message ?? '')));
                                  }
                                }
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                              style: ButtonStyle(
                                textStyle: MaterialStateProperty.all(
                                    TextStyle(fontSize: 20.0)),
                                elevation:
                                    MaterialStateProperty.all<double>(0.0),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue),
                                //   shadowColor: MaterialStateProperty.all<Color>(Colors.amberAccent),
                                minimumSize:
                                    MaterialStateProperty.all(Size(50, 50)),
                                fixedSize:
                                    MaterialStateProperty.all(Size(300, 50)),
                                side: MaterialStateProperty.all(
                                    BorderSide(color: Colors.white)),
                              ),
                            ),
                    ),

                    SizedBox(
                      height: 18.0,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginPage(
                                //user: widget.user,
                                )));
                      },
                      child: Text(
                        'Already have an account.. click here',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? _requiredValidator(String? text) {
    if (text == null || text.trim().isEmpty) {
      return "This field is required";
    }
    return null;
  }

  // Future UserRegister() async {
  //   setState(() {
  //     loading = true;
  //   });
  //   try {
  //     final client = Register(
  //       uid: widget.user.uid,
  //       fullName: fullnames.text,
  //       gender: genderController.text,
  //       email: emailaddress.text,
  //       password: password.text,
  //     );
  //     await firestore
  //         .collection('UserRegister')
  //         .doc(client.uid)
  //         .set(client.toJson());
  //     await showDialog(
  //         context: context,
  //         builder: (context) => AlertDialog(
  //               title: Text(''),
  //               content: Text('Account was created sucesssfully'),
  //               actions: [
  //                 TextButton(
  //                     onPressed: () {
  //                       Navigator.of(context).pop();
  //                     },
  //                     child: Text('Okay'))
  //               ],
  //             ));
  //     Navigator.of(context).pop();
  //     Navigator.of(context).push(MaterialPageRoute(
  //         builder: (context) => LoginPage(
  //               user: widget.user,
  //             )));
  //   } on FirebaseAuthException catch (e) {
  //     setState(() {
  //       loading = false;
  //     });
  //   }
  // }
}
